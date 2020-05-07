## Process this file with automake to produce Makefile.in
##créer un fichier swrpowermeterf8kgl_modules.cc qui est la librairie
##modifier le makefile.am comme ci-dessous
##cd .../gpsim.0.31
## autoreconf
##./configure
##make
##sudo make install
#sudo /sbin/ldconfig

AM_CPPFLAGS = @X_CFLAGS@

lib_LTLIBRARIES = libgpsim_modules.la
#	lib_swrpowermeterf8kgl_modules.la

#lib_swrpowermeterf8kgl_modules_la_SOURCES = \
#	swrpowermeterf8kgl_modules.cc \
#	module_attribute.h \
#	ltc2305.cc ltc2305.h

#lib_swrpowermeterf8kgl_modules_la_LIBADD = ../eXdbm/libgpsim_eXdbm.la -lstdc++ -lpopt \
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
	i2c.cc i2c.h 
#	ltc2305.cc ltc2305.h
 # TSD - removed 17APR06 #PGS added back
##	paraface.cc paraface.h \  # TSD - removed 16APR06

libgpsim_modules_la_LIBADD = ../eXdbm/libgpsim_eXdbm.la -lstdc++ -lpopt \
  @X_LDFLAGS@ @Y_LDFLAGS@ @LIBREADLINE@ ../src/libgpsim.la

EXTRA_DIST = makefile.mingw
