/*
   Copyright (C) 2014 Martin Habets

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

#if !defined(__MODULE_ATTRIBUTES_H__)
#define __MODULE_ATTRIBUTES_H__

#include "../src/value.h"

/* The classes below are wrappers for simple values that must show up in
 * the breadboard settings. Without "Attribute" in the class name they won't.
 */
class BooleanAttribute : public Boolean
{
public:
  BooleanAttribute(const char *_name, bool newValue = false,
		   const char *desc=0)
    : Boolean(_name, newValue, desc)
  {
  }
};

class IntegerAttribute : public Integer
{
public:
  IntegerAttribute(const char *_name, gint64 newValue = 0, const char *desc=0)
    : Integer(_name, newValue, desc)
  {
  }
};
#endif //if !defined(__MODULE_ATTRIBUTES_H__)
