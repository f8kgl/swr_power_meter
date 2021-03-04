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

#define DEBUG
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
#include "lt1818.h"


class AddAttribute : public Integer {
public:
  //LT1818_Modules::lt1818 *i2cpt;

  explicit AddAttribute(LT1818_Modules::lt1818 *_i2cpt) :
    Integer("Slave_Address", 0x00, "I2C Slave Address")
  {
    gint64 v;
    Integer::get(v);
    set(v);
  }
  virtual void set(gint64 v)
  {
    Integer::set(v);
    }
};


class IOPort_lt1818 : public PortModule
//class IOPort : public PortRegister
{
public:
  unsigned int direction;

  //    virtual void put(unsigned int new_value);
  explicit IOPort_lt1818(unsigned int _num_iopins = 4);
  void update_pin_directions(unsigned int);
  double put(unsigned int);
};


//IOPort::IOPort(unsigned int _num_iopins) : PortRegister(_num_iopins, "P", "")
IOPort_lt1818::IOPort_lt1818(unsigned int _num_iopins)
  : PortModule(_num_iopins), direction(0)
{
}

#define R2 1
#define R1 1
#if 0
#define R_inv 625
#define END_TO_END_RESISTANCE 10000 //ne tient pas compte de la valeur calibrée
#define CDE_WRITE_RDAC 0x01
#endif
double IOPort_lt1818::put(unsigned int value)
{
  IOPIN *m_pin_in;
  double voltage_in=0.0;
  double voltage_out=0.0;
//  double rdac=(double) value*END_TO_END_RESISTANCE/1024;

//  Dprintf(("rdac=%lf\n", rdac));

  if ((m_pin_in = getPin(0))) {
    voltage_in = m_pin_in->get_nodeVoltage();
    voltage_in = (2.5*voltage_in)/0.036946;
  }

  voltage_out = 2.048 - voltage_in*(R2/R1);

  Dprintf(("voltage_in=%lf voltage_out=%lf \n", voltage_in, voltage_out));

  return voltage_out;
}


void IOPort_lt1818::update_pin_directions(unsigned int new_direction)
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


namespace LT1818_Modules {

lt1818::lt1818(const char *_name)
  : Module(_name, "lt1818")
{
  io_port = new IOPort_lt1818(2);
  res_out = new IO_bi_directional_pu("out");
  res_out->set_Vpullup(2.0);
  Addattr = new AddAttribute(this);

  addSymbol(Addattr);
  //Addattr->set(0x27);
}


lt1818::~lt1818()
{
  delete io_port;
  delete Addattr;
  delete res_out;

  for (int i = 0; i < 8; i++) {
    removeSymbol(pins[i]);
  }

  delete [] pins;
  // set sda, scl to zero as package deletes them,
  // thus stopping ~i2c_slave from trying to delete them also
}


void lt1818::put_data(unsigned int data)
{

  Dprintf(("lt1818::put_data() 0x%x\n", data));
#if 0
  if (byte_number==0) {
    current_cde = (data & 0x3C) >>2;
    switch (current_cde) {
    case CDE_WRITE_RDAC:
      rdac_value = (data&0x03)<<8;
      Dprintf(("set rdac to 0x%02x\n",rdac_value));
      break;
    default:
      Dprintf(("unknown command 0x%x \n",current_cde ));
    }
    byte_number=1;
  }else {
    switch (current_cde) {
    case CDE_WRITE_RDAC:
      rdac_value |= data;
      Dprintf(("set rdac to 0x%02x\n",rdac_value));
      voltage_out = io_port->put(rdac_value);
      res_out->set_Vpullup(voltage_out);
      res_out->updateNode();
      Dprintf(("vPullup=%lf \n", res_out->get_Vpullup()));
      break;
    default:
      Dprintf(("unknown command 0x%x \n",current_cde ));

    }
    byte_number =0;
  }
#endif
}


unsigned int lt1818::get_data()
{
  return 0;
}

void lt1818::slave_transmit(bool input)
{
  io_port->update_pin_directions(input == false);
}


bool lt1818::match_address()
{
  return 0;
}

Module *lt1818::construct(const char *_new_name)
{
  std::string att_name = _new_name;
  lt1818 *pEE = new lt1818(_new_name);
  pEE->res_out->set_Vpullup(2.0);
  pEE->res_out->set_Vth(2.0);
  pEE->res_out->set_Zpullup(10e3);
  pEE->res_out->setDriving(false);
  pEE->res_out->update_pullup('1', true);
  pEE->res_out->updateNode();
  pEE->create_iopin_map();
  return pEE;
}


void lt1818::create_iopin_map()
{
  pins = new IO_bi_directional_pu *[1];
  char pin_name_in[]="in";
  package = new Package(4);

  pins[0] =  new IO_bi_directional_pu(pin_name_in);
  package->assign_pin(1, io_port->addPin(pins[0], 0));
  addSymbol(pins[0]);
  package->assign_pin(2, res_out);
  addSymbol(res_out);

}


} // end of namespace AD5175_Modules
