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

/*

  resistor.cc

  This is gpsim's resistor component.

  resistor
  pullup
  pulldown

*/


/* IN_MODULE should be defined for modules */
//#define IN_MODULE

#include <iostream>
#include <string>

#include "../config.h"

#ifdef HAVE_GUI
#include <gtk/gtk.h>
#endif

#include "detector.h"
#include "../src/stimuli.h"
#include "../src/value.h"
#include "../src/ui.h"
#include "../src/gpsim_interface.h"

//----------------------------------------

class DetectorAttribute : public Float {
public:
  PullupResistor *pur;

  explicit ResistanceAttribute(PullupResistor *ppur)
    : Float("resistance", 0.0, "resistance value of the pullup"),
      pur(ppur)
  {
    if (pur) {
      Float::set((pur->res)->get_Zth());
    }
  }

  virtual void set(double r)
  {
    Float::set(r);

    if (pur) {
      pur->res->set_Zpullup(r);
      pur->res->updateNode();
    }
  }

  void set(int r)
  {
    Float::set((double)r);
  }
};


//----------------------------------------

class CapacitanceAttribute : public Float {
public:
  PullupResistor *pur;

  explicit CapacitanceAttribute(PullupResistor *ppur)
    : Float("capacitance", 0.0, "pin capacitance of pullup resistor"),
      pur(ppur)
  {
    if (pur) {
      Float::set(pur->res->get_Cth());
    }
  }

  void set(double r)
  {
    Float::set(r);

    if (pur) {
      pur->res->set_Cth(r);
      pur->res->updateNode();
    }
  }

  void set(int r)
  {
    set(double(r));
  }
};


//----------------------------------------

class VoltageAttribute : public Float {
public:
  PullupResistor *pur;

  explicit VoltageAttribute(PullupResistor *ppur)
    : Float("voltage", 0.0, "Voltage of pullup resistor"),
      pur(ppur)
  {
    if (pur) {
      Float::set(pur->res->get_Vpullup());
    }
  }

  void set(double r)
  {
    Float::set(r);

    if (pur) {
      pur->res->set_Vpullup(r);
      pur->res->updateNode();
    }
  }

  void set(int r)
  {
    set(double(r));
  }
};


//--------------------------------------------------------------
// PullupResistor::create_iopin_map
//

void PullupResistor::create_iopin_map()
{
  //   The PullupResistor has only one pin.
  create_pkg(1);
  // Define the I/O pins and assign them to the package.
  //   There are two things happening here. First, there is
  //   a new I/O pin that is being created.The second thing is
  //   that the pins are "assigned" to the package. If we
  //   need to reference these newly created I/O pins (like
  //   below) then we can call the member function 'get_pin'.
  assign_pin(1, res);
}


//--------------------------------------------------------------

Module * PullupResistor::pu_construct(const char *_new_name)
{
  PullupResistor *pur = new PullupResistor(_new_name, "Pullup Resistor");
  pur->res->set_Vth(5.0);
  pur->res->set_Vpullup(5.0);
  return pur;
}


//--------------------------------------------------------------
Module * PullupResistor::pd_construct(const char *_new_name)
{
  PullupResistor *pur = new PullupResistor(_new_name, "PullDown resistor", 0.0);
  pur->res->set_Vth(0.0);
  pur->res->set_Vpullup(0.0);
  return pur;
}


//--------------------------------------------------------------
PullupResistor::PullupResistor(const char *init_name, const char *desc, float vinit)
  : Module(init_name, desc)
{
  std::string s;

  // set the module name
  if (init_name) {
    s = init_name;
    new_name(init_name);
    s.append(".pin");
  }

  //rRRres = new IO_bi_directional_pu(s.c_str());
  res = new IO_bi_directional_pu("pin");
  res->set_Vpullup(vinit);
  create_iopin_map();
  // Default module attributes.
  //initializeAttributes();
  set_description(
    "pullup resistor or generic voltage source\n"
    " Attributes:\n"
    " .resistance - pullup resistance\n"
    " .voltage - pullup or drive voltage\n"
    " .capacitance - pin capacitance\n");

  if (verbose) {
    std::cout << description() << '\n';
  }

  // Note ResistanceAttribute is designed to give access
  // to res.Zth with a symbol name of "modulename + '.resistance'".
  attr = new ResistanceAttribute(this);
  cattr = new CapacitanceAttribute(this);
  vattr = new VoltageAttribute(this);
  addSymbol(res);
  addSymbol(attr);
  addSymbol(cattr);
  addSymbol(vattr);
  attr->set(10e3);
  cattr->set(0.0);
  res->setDriving(false);
  res->update_pullup('1', true);
  vattr->set(res->get_Vpullup());
#ifdef MANAGING_GUI
  pu_window = nullptr;

  if (get_interface().bUsingGUI()) {
    build_window();
  }

#endif
}


PullupResistor::~PullupResistor()
{
  removeSymbol(attr);
  removeSymbol(cattr);
  removeSymbol(vattr);
  delete attr;
  delete cattr;
  delete vattr;
}


#ifdef MANAGING_GUI

static void pu_cb(GtkWidget *button, gpointer pur_class)
{
  // PullupResistor *pur = (PullupResistor *)pur_class;
}


void PullupResistor::build_window()
{
  GtkWidget *buttonbox;
  GtkWidget *button;
  pu_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  buttonbox = gtk_hbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(pu_window), buttonbox);
  gtk_container_set_border_width(GTK_CONTAINER(buttonbox), 1);
  button = gtk_button_new_with_label(name().c_str());
  g_signal_connect(button, "clicked",
                   G_CALLBACK(pu_cb), (gpointer)this);
  gtk_box_pack_start(GTK_BOX(buttonbox), button, TRUE, TRUE, 0);
  gtk_widget_show_all(pu_window);
  set_widget(pu_window);
}


#endif
