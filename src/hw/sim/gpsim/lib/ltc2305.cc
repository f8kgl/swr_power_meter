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
#include "ltc2305.h"


class AddAttribute : public Integer {
public:
  LTC2305_Modules::ltc2305 *i2cpt;

  explicit AddAttribute(LTC2305_Modules::ltc2305 *_i2cpt) :
    Integer("Slave_Address", 0x08, "I2C Slave Address"), i2cpt(_i2cpt)
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


class IOPort_ltc2305 : public PortModule
//class IOPort : public PortRegister
{
public:
  unsigned int direction;

  //    virtual void put(unsigned int new_value);
  explicit IOPort_ltc2305(unsigned int _num_iopins = 4);
  void update_pin_directions(unsigned int);
  unsigned int get(unsigned int config);
};


//IOPort::IOPort(unsigned int _num_iopins) : PortRegister(_num_iopins, "P", "")
IOPort_ltc2305::IOPort_ltc2305(unsigned int _num_iopins)
  : PortModule(_num_iopins), direction(0)
{
}

unsigned int IOPort_ltc2305::get(unsigned int config)
{
  double voltage = 0.0;
  double voltage0 = 0.0;
  double voltage1 = 0.0;

    IOPIN *m_pin0;
    IOPIN *m_pin1;

    switch (config&0xC0) {
      case  ((0<<S_D)|(0<<O_S)):
      if ((m_pin0 = getPin(0))&&(m_pin1 = getPin(1))) {
        voltage0 = m_pin0->get_nodeVoltage();
        voltage1 = m_pin1->get_nodeVoltage();
        voltage0 = (2.5*voltage0)/0.036946;
        voltage1 = (2.5*voltage1)/0.036946;
        if (voltage0 >4.096) {
          voltage = 4.096;
        }
        if (voltage1 >4.096) {
          voltage = 4.096;
        }
        voltage = voltage0 - voltage1;
      }
      break;
      case  ((0<<S_D)|(1<<O_S)):
      if ((m_pin0 = getPin(0))&&(m_pin1 = getPin(1))) {
        voltage0 = m_pin0->get_nodeVoltage();
        voltage1 = m_pin1->get_nodeVoltage();
        voltage0 = (2.5*voltage0)/0.036946;
        voltage1 = (2.5*voltage1)/0.036946;
        if (voltage0 >4.096) {
          voltage = 4.096;
        }
        if (voltage1 >4.096) {
          voltage = 4.096;
        }
        voltage = - voltage0 + voltage1;
      }
      break;
      case  ((1<<S_D)|(0<<O_S)):
      if ((m_pin0 = getPin(0))) {
        voltage = m_pin0->get_nodeVoltage();
        voltage = (2.5*voltage)/0.036946;
      }
      break;
      case  ((1<<S_D)|(1<<O_S)):
      if ((m_pin1 = getPin(1))) {
        voltage = m_pin1->get_nodeVoltage();
        voltage = (2.5*voltage)/0.036946;
      }
      break;
    }

    if (voltage >4.096) {
      voltage = 4.096;
    }


    unsigned int adc_value = (unsigned int)( 4096* voltage )/4.096;
    adc_value = adc_value&0x0FFF; //12 bits


    Dprintf(("voltage=%lf (0x%04x)\n", voltage, adc_value));

  return adc_value;
}

void IOPort_ltc2305::update_pin_directions(unsigned int new_direction)
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


namespace LTC2305_Modules {

ltc2305::ltc2305(const char *_name)
  : i2c_slave(), Module(_name, "ltc2305")
{
  io_port = new IOPort_ltc2305(4);
  Addattr = new AddAttribute(this);
  addSymbol(Addattr);
  data_byte_to_send=MSB;
  config_word = 0;
  //Addattr->set(0x27);
}


ltc2305::~ltc2305()
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


void ltc2305::put_data(unsigned int data)
{
  Dprintf(("ltc2305::put_data() 0x%x\n", data));
  config_word = data;
//normalement il faudrait démarrer un timer
  converted = io_port->get(config_word);

}

unsigned int ltc2305::get_data()
{
  unsigned int data;

  Dprintf(("ltc2305::get_data() 0x%04x %d\n", converted,data_byte_to_send));

//si le timer est arrivé à échéance, alors on calcule data comme ci-dessous
//sinon, que vaut data d'ailleurs ?
  if (data_byte_to_send==LSB) {
    data = (converted&0x0F)<<4; //bits de poids faible
    data_byte_to_send = MSB;
  }else {
    data = (converted&0xFF0)>>4;
    data_byte_to_send = LSB;
  }
  Dprintf(("ltc2305::get_data() 0x%02x\n", data));

  return data;
}

void ltc2305::slave_transmit(bool input)
{
  io_port->update_pin_directions(input == false);
}


bool ltc2305::match_address()
{
  Dprintf(("ltc2305::match_address() 0x%x\n", xfr_data));
  return ((xfr_data & 0xfe) == i2c_slave_address);
}


Module *ltc2305::construct(const char *_new_name)
{
  std::string att_name = _new_name;
  ltc2305 *pEE = new ltc2305(_new_name);
  pEE->create_iopin_map();
  return pEE;
}


void ltc2305::create_iopin_map()
{
  pins = new IO_bi_directional_pu *[2];
  char pin_name[] = "CH0";
  addSymbol((IOPIN *)sda);
  addSymbol((IOPIN *)scl);
  package = new Package(4);

  for (int i = 0; i < 2; i++) {
    pin_name[2] = '0' + i;
    pins[i] = new IO_bi_directional_pu(pin_name);
    package->assign_pin(i + 1, io_port->addPin(pins[i], i));
    addSymbol(pins[i]);
  }

  package->assign_pin(3, (IOPIN *)(sda));
  package->assign_pin(4, (IOPIN *)(scl));


}


} // end of namespace LTC2305_Modules
