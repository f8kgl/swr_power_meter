/*
   Copyright (C) 1998,1999,2000,2001 T. Scott Dattalo

This file is part of the libgpsim_modules library of gpsim

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, see
<http://www.gnu.org/licenses/lgpl-2.1.html>.
*/


#ifndef MODULES_RESISTOR_H_
#define MODULES_RESISTOR_H_

/* IN_MODULE should be defined for modules */
#define IN_MODULE

#ifdef HAVE_GUI
#include <gtk/gtk.h>
#else
struct GtkToggleButton;
#endif


#include <glib.h>

#include "../src/modules.h"
#include "../src/stimuli.h"

class  ResistanceAttribute;
class  CapacitanceAttribute;
class  VoltageAttribute;

class PullupResistor : public Module, public TriggerObject {
public:
  IO_bi_directional_pu *res;

#ifdef MANAGING_GUI

  GtkWidget *pu_window;

#endif

  PullupResistor(const char *init_name = nullptr, const char *desc = nullptr, float vinit = 5.0);
  ~PullupResistor();

  // Inheritances from the Package class
  virtual void create_iopin_map();

  static Module *pu_construct(const char *new_name = nullptr);
  static Module *pd_construct(const char *new_name = nullptr);

#ifdef MANAGING_GUI
  void build_window();
#endif
private:
  ResistanceAttribute *attr;
  CapacitanceAttribute *cattr;
  VoltageAttribute *vattr;
};


#endif // MODULES_RESISTOR_H_
