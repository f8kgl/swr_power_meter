## Process this file with automake to produce Makefile.in
##créer un fichier swrpowermeterf8kgl_modules.cc qui est la librairie
##créer des liens symboliques des sources dans .../gpsim0.31/modules
## ex : cd ...gpsim0.31/modules
## ln -s ~/devel/f8kgl/swr_power_meter/src/hw/sim/gpsim/lib/Makefile.am
## ln -s ~/devel/f8kgl/swr_power_meter/src/hw/sim/gpsim/lib/ltc2305.cc
##ln -s ~/devel/f8kgl/swr_power_meter/src/hw/sim/gpsim/lib/libswrpowermeterf8kgl_modules.cc
## etc etc (ne pas oublier les header, et autres sources)
##modifier le makefile.am comme ci-dessous
##cd .../gpsim.0.31
## autoreconf
##./configure
##make
##sudo make install
#sudo /sbin/ldconfig

AM_CPPFLAGS = @X_CFLAGS@

lib_LTLIBRARIES = libgpsim_modules.la \
	libswrpowermeterf8kgl_modules.la

libswrpowermeterf8kgl_modules_la_SOURCES = \
	swrpowermeterf8kgl_modules.cc \
	module_attribute.h \
	ltc2305.cc ltc2305.h \
	ad5175.cc ad5175.h

libswrpowermeterf8kgl_modules_la_LIBADD = ../eXdbm/libgpsim_eXdbm.la -lstdc++ -lpopt \
  @X_LDFLAGS@ @Y_LDFLAGS@ @LIBREADLINE@ ../src/libgpsim.la

libgpsim_modules_la_SOURCES = \
	gpsim_modules.cc \
	module_attribute.h \
	resistor.cc resistor.h \
	usart.cc usart.h \
	switch.cc switch.h \
	logic.cc logic.h \
	led.cc led.h \
	push_button.cc push_button.h \
	encoder.cc encoder.h \
	i2c-eeprom.cc i2c-eeprom.h \
	m_stimuli.h m_stimuli.cc \
	ttl.cc ttl.h \
	video.cc video.h \
	i2c.cc i2c.h \
	i2c2par.cc i2c2par.h
 # TSD - removed 17APR06 #PGS added back
##	paraface.cc paraface.h \  # TSD - removed 16APR06

libgpsim_modules_la_LIBADD = ../eXdbm/libgpsim_eXdbm.la -lstdc++ -lpopt \
  @X_LDFLAGS@ @Y_LDFLAGS@ @LIBREADLINE@ ../src/libgpsim.la

EXTRA_DIST = makefile.mingw
