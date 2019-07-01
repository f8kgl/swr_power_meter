<Qucs Schematic 0.0.20>
<Properties>
  <View=0,-34,1441,686,0.826447,0,0>
  <Grid=10,10,1>
  <DataSet=SWR_POWER_METER_F8KGL_detecteur.dat>
  <DataDisplay=SWR_POWER_METER_F8KGL_detecteur.dpl>
  <OpenDisplay=1>
  <Script=SWR_POWER_METER_F8KGL_detecteur.m>
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
  <GND * 5 660 260 0 0 0 0>
  <GND * 5 560 260 0 0 0 0>
  <.SW SW1 0 870 270 0 73 0 0 "TR1" 1 "lin" 1 "freq" 1 "1MHz" 1 "100MHz" 1 "10" 1>
  <Eqn Eqn1 1 900 570 -30 16 0 0 "Pout_dBm=10*log10(1000*((Output.Vt^2)/50))" 1 "Vin=sqrt(50*(0.001*10^(Pin_dBm/10)))" 1 "yes" 0>
  <Diode BAS70_1 1 500 160 -26 -32 0 2 "3.22e-09" 0 "1.018" 0 "1.655e-12" 0 "0.3583" 0 "0.349" 0 "0.5" 0 "0" 0 "0" 0 "2" 0 "20.89" 0 "0" 0 "0" 0 "0" 0 "1" 0 "1" 0 "77" 0 "1.67e-07" 0 "26.85" 0 "2" 0 "0.69" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "26.85" 0 "1.0" 0 "normal" 0>
  <R R1 1 660 210 15 -26 0 1 "100k Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vac V1 1 370 190 18 -26 0 1 "Vin" 1 "freq" 0 "0" 0 "0" 0>
  <GND * 5 440 260 0 0 0 0>
  <GND * 5 370 260 0 0 0 0>
  <R R2 1 440 210 15 -26 0 1 "47 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Eqn Eqn2 1 900 490 -30 16 0 0 "freq=500*10^6" 1 "yes" 0>
  <.TR TR1 1 880 100 0 73 0 0 "lin" 1 "0" 1 "15u" 1 "100000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <C C1 1 560 210 17 -26 0 1 "100pF" 1 "" 0 "neutral" 0>
  <Eqn Eqn3 0 1050 490 -30 16 0 0 "Pin_dBm=-4" 1 "yes" 0>
  <.SW SW2 1 1010 270 0 73 0 0 "TR1" 1 "lin" 1 "Pin_dBm" 1 "11" 1 "28" 1 "18" 1>
</Components>
<Wires>
  <660 160 660 180 "" 0 0 0 "">
  <660 240 660 260 "" 0 0 0 "">
  <560 160 660 160 "Output" 670 130 76 "">
  <530 160 560 160 "" 0 0 0 "">
  <370 160 440 160 "Input" 480 110 50 "">
  <370 220 370 260 "" 0 0 0 "">
  <440 160 470 160 "" 0 0 0 "">
  <440 160 440 180 "" 0 0 0 "">
  <440 240 440 260 "" 0 0 0 "">
  <560 160 560 180 "" 0 0 0 "">
  <560 240 560 260 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
