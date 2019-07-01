<Qucs Schematic 0.0.20>
<Properties>
  <View=0,-263,1953,919,1.94872,1751,550>
  <Grid=10,10,1>
  <DataSet=SWR_POWER_METER_F8KGL_etude_coupleur_directif.dat>
  <DataDisplay=SWR_POWER_METER_F8KGL_etude_coupleur_directif.dpl>
  <OpenDisplay=1>
  <Script=SWR_POWER_METER_F8KGL_etude_coupleur_directif.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Titre>
  <FrameText1=Auteur :>
  <FrameText2=Date :>
  <FrameText3=Version :>
</Properties>
<Symbol>
  <.ID -20 -16 SUB>
  <Line -20 20 40 0 #000080 2 1>
  <Line 20 20 0 -40 #000080 2 1>
  <Line -20 -20 40 0 #000080 2 1>
  <Line -20 20 0 -40 #000080 2 1>
</Symbol>
<Components>
  <GND *5 5 890 150 0 0 0 0>
  <GND *6 5 930 220 0 0 0 0>
  <GND *7 5 1110 150 0 0 0 0>
  <Pac P5 1 890 120 -74 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P8 1 930 190 -74 -26 1 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P6 1 1110 120 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <SUBST SubstTC2 1 1450 90 -30 24 0 0 "4.35" 1 "1.6 mm" 1 "17.5 um" 1 "0.0001" 1 "5e-06" 1 "1.5e-07" 1>
  <.SP SPTC2 1 1430 270 0 73 0 0 "log" 1 "3 MHz" 1 "1 GHz" 1 "10000" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 1480 470 -31 17 0 0 "reflect=dB(S[1,1])" 1 "ndcoupled=dB(S[3,2])" 1 "ndreflect=dB(S[2,2])" 1 "ndisolated=dB(S[4,2])" 1 "ndthrough=dB(S[1,2])" 1 "isolated=dB(S[3,1])" 1 "through=dB(S[2,1])" 1 "coupled=dB(S[4,1])" 1 "yes" 0>
  <Pac P7 1 1100 210 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND *8 5 1100 250 0 0 0 0>
  <MCOUPLED MSTC2 1 980 100 -26 37 0 0 "SubstTC2" 1 "2.54 mm" 1 "85 mm" 1 "3 mm" 1 "Kirschning" 0 "Kirschning" 0 "26.85" 0>
</Components>
<Wires>
  <890 70 950 70 "" 0 0 0 "">
  <890 70 890 90 "" 0 0 0 "">
  <930 130 930 160 "" 0 0 0 "">
  <930 130 950 130 "" 0 0 0 "">
  <1110 70 1110 90 "" 0 0 0 "">
  <1010 70 1110 70 "" 0 0 0 "">
  <1010 130 1100 130 "" 0 0 0 "">
  <1100 130 1100 180 "" 0 0 0 "">
  <1100 240 1100 250 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
