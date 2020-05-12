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


#ifndef MODULES_LTC2305_H_
#define MODULES_LTC2305_H_

/* IN_MODULE should be defined for modules */
#define IN_MODULE

#include "src/modules.h"
#include "src/ioports.h"
#include "src/stimuli.h"
#include "src/trigger.h"
#include "src/i2c-ee.h"

#define S_D 7
#define O_S 6
#define UNI 3
#define SLP 2

#define MSB 0
#define LSB 1


class IOPort_ltc2305;
class AddAttribute;
namespace LTC2305_Modules {

class ltc2305 : public i2c_slave, public Module { //, public TriggerObject
public:
  explicit ltc2305(const char *_name);
  ~ltc2305();

  static Module *construct(const char *new_name);
  virtual void create_iopin_map();
  virtual void setEnable(bool /* bNewState */ , unsigned int /* m_bit */ ) {}
  virtual bool match_address();
  virtual void put_data(unsigned int data);
  virtual unsigned int get_data();
  virtual void slave_transmit(bool yes);

  IOPort_ltc2305 *io_port;
  unsigned int data_byte_to_send;
  unsigned int config_word;
  unsigned int converted = 0;


protected:
  AddAttribute *Addattr;
  IO_bi_directional_pu **pins;
};


} // end of namespace LTC2305_Modules

#endif // MODULES_LTC2305_H_
