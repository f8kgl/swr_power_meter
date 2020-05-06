/*
   Copyright (C) 2015 Roy R Rankin

This file is part of gpsim.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

/*
    This module simulates a 7 bit address slave I2C device with an 8 bit
    I/O bus. The direction of the 8 bit bus is controlled by the R/W bit
    sent from the master.

    This module allows multi-pin devices such as LCD displays to be
    connected to the processor via the 2 pin I2C bus.
*/

#include <cstdio>

//#define DEBUG
#if defined(DEBUG)
#define Dprintf(arg) {printf("%s:%d ",__FILE__,__LINE__); printf arg; }
#else
#define Dprintf(arg) {}
#endif

#include "config.h"    // get the definition for HAVE_GUI
#ifdef HAVE_GUI
#include <gtk/gtk.h>
#endif

#include "src/gpsim_time.h"
#include "src/stimuli.h"
#include "src/ioports.h"
#include "src/symbol.h"
#include "src/value.h"
#include "src/packages.h"
#include "src/gpsim_interface.h"
#include "ad5175.h"


class AddAttribute : public Integer {
public:
  AD5175_Modules::ad5175 *i2cpt;

  explicit AddAttribute(AD5175_Modules::ad5175 *_i2cpt) :
    Integer("Slave_Address", 0x00, "I2C Slave Address"), i2cpt(_i2cpt)
  {
    gint64 v;
    Integer::get(v);
    set(v);
  }
  virtual void set(gint64 v)
  {
    Integer::set(v);

    if (i2cpt) {
      i2cpt->i2c_slave_address = (v << 1);
    }
  }
};


class IOPort : public PortModule
//class IOPort : public PortRegister
{
public:
  unsigned int direction;

  //    virtual void put(unsigned int new_value);
  explicit IOPort(unsigned int _num_iopins = 8);
  void update_pin_directions(unsigned int);
  void put(unsigned int);
  unsigned int get();
};


//IOPort::IOPort(unsigned int _num_iopins) : PortRegister(_num_iopins, "P", "")
IOPort::IOPort(unsigned int _num_iopins)
  : PortModule(_num_iopins), direction(0)
{
}

#define CDE_WRITE_RDAC 0x01
void IOPort::put(unsigned int value)
{
  unsigned int cde = (value & 0x3C) >>2;
  IOPIN *m_pin_in;
  IOPIN *m_pin_out;
  double voltage_in=0.0;
  double voltage_out=0.0;
  unsigned int rdac=0;


  switch (cde) {
    case CDE_WRITE_RDAC:
      rdac = 5000;
      break;
  }
  if ((m_pin_in = getPin(0))) {
    voltage_in = m_pin_in->get_nodeVoltage();
    voltage_in = (2.5*voltage_in)/0.036946;
  }

  voltage_out = voltage_in*(1+rdac/25);

  if ((m_pin_out = getPin(1))) {
    m_pin_out->set_nodeVoltage(voltage_out);
  }


}


unsigned int IOPort::get()
{

  return 0xFF;
}

void IOPort::update_pin_directions(unsigned int new_direction)
{
  if ((new_direction ^ direction) & 1) {
    direction = new_direction & 1;

    for (int i = 0; i < 8; i++) {
      IOPIN *m_pin;

      if ((m_pin = getPin(i))) {
        m_pin->update_direction(direction, true);

        if (m_pin->snode) {
          m_pin->snode->update();
        }
      }
    }
  }
}


namespace AD5175_Modules {

ad5175::ad5175(const char *_name)
  : i2c_slave(), Module(_name, "ad5175")
{
  io_port = new IOPort(4);
  Addattr = new AddAttribute(this);
  addSymbol(Addattr);
  //Addattr->set(0x27);
}


ad5175::~ad5175()
{
  delete io_port;
  delete Addattr;

  for (int i = 0; i < 8; i++) {
    removeSymbol(pins[i]);
  }

  delete [] pins;
  removeSymbol((IOPIN *)scl);
  removeSymbol((IOPIN *)sda);
  // set sda, scl to zero as package deletes them,
  // thus stopping ~i2c_slave from trying to delete them also
  sda = nullptr;
  scl = nullptr;
}


void ad5175::put_data(unsigned int data)
{
  Dprintf(("ad5175::put_data() 0x%x\n", data));
  io_port->put(data);
}


unsigned int ad5175::get_data()
{
  Dprintf(("i2c2par::get_data() 0x%x\n", io_port->get()));
  return io_port->get();
}

void ad5175::slave_transmit(bool input)
{
  io_port->update_pin_directions(input == false);
}


bool ad5175::match_address()
{
  Dprintf(("ad5175::match_address() 0x%x\n", xfr_data));
  return ((xfr_data & 0xfe) == i2c_slave_address);
}


Module *ad5175::construct(const char *_new_name)
{
  std::string att_name = _new_name;
  ad5175 *pEE = new ad5175(_new_name);
  pEE->create_iopin_map();
  return pEE;
}


void ad5175::create_iopin_map()
{
  pins = new IO_bi_directional_pu *[2];
  char pin_name_in[]="in";
  char pin_name_out[]="out";
  addSymbol((IOPIN *)sda);
  addSymbol((IOPIN *)scl);
  package = new Package(4);

  pins[0] =  new IO_bi_directional_pu(pin_name_in);
  package->assign_pin(1, io_port->addPin(pins[0], 0));
  addSymbol(pins[0]);
  pins[1] =  new IO_bi_directional_pu(pin_name_out);
  package->assign_pin(2, io_port->addPin(pins[1], 1));
  addSymbol(pins[1]);

  package->assign_pin(3, (IOPIN *)(sda));
  package->assign_pin(4, (IOPIN *)(scl));
}


} // end of namespace AD5175_Modules
