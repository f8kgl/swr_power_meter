<Qucs Schematic 0.0.20>
<Properties>
  <View=60,-94,1441,740,0.909092,0,55>
  <Grid=10,10,1>
  <DataSet=SWR_POWER_METER_F8KGL_etude_detecteur_V0.6_@2.2.2.dat>
  <DataDisplay=SWR_POWER_METER_F8KGL_etude_detecteur_V0.6_@2.2.2.dpl>
  <OpenDisplay=1>
  <Script=SWR_POWER_METER_F8KGL_etude_detecteur_V0.6_@2.2.2.m>
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
  <GND * 5 680 260 0 0 0 0>
  <GND * 5 810 270 0 0 0 0>
  <.SW SW2 0 1050 270 0 73 0 0 "TR1" 1 "lin" 1 "Pin_dBm" 1 "11" 1 "28" 1 "18" 1>
  <.SW SW1 0 910 270 0 73 0 0 "TR1" 1 "lin" 1 "freq" 1 "1MHz" 1 "100MHz" 1 "10" 1>
  <Eqn Eqn2 1 950 500 -30 16 0 0 "freq=500*10^6" 1 "yes" 0>
  <Eqn Eqn3 1 1110 500 -30 16 0 0 "Pin_dBm=-10" 1 "yes" 0>
  <Eqn Eqn1 1 1000 590 -30 16 0 0 "Pout_dBm=10*log10(1000*((Output.Vt^2)/50))" 1 "Vin=sqrt(50*(0.001*10^(Pin_dBm/10)))" 1 "yes" 0>
  <C C2 1 810 210 17 -26 0 1 "1nF" 1 "" 0 "neutral" 0>
  <GND * 5 460 260 0 0 0 0>
  <C C1 1 460 210 17 -26 0 1 "100pF" 1 "" 0 "neutral" 0>
  <Diode BAS70_1 1 400 160 -26 -33 0 2 "3.22e-09" 0 "1.018" 0 "1.655e-12" 0 "0.3583" 0 "0.349" 0 "0.5" 0 "0" 0 "0" 0 "2" 0 "20.89" 0 "0" 0 "0" 0 "0" 0 "1" 0 "1" 0 "77" 0 "1.67e-07" 0 "26.85" 0 "2" 0 "0.69" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "26.85" 0 "1.0" 0 "normal" 0>
  <Vac V1 1 250 190 18 -26 0 1 "Vin" 1 "freq" 0 "0" 0 "0" 0>
  <GND * 5 250 230 0 0 0 0>
  <GND * 5 340 270 0 0 0 0>
  <R R2 1 340 210 15 -26 0 1 "47 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R3 1 590 160 -26 15 0 0 "21500 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R4 1 680 210 15 -26 0 1 "78700 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <.TR TR1 1 900 100 0 73 0 0 "lin" 1 "0" 1 "1m" 1 "2e+06" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
</Components>
<Wires>
  <680 160 680 180 "" 0 0 0 "">
  <620 160 680 160 "" 0 0 0 "">
  <680 160 810 160 "Output" 810 130 99 "">
  <810 160 810 180 "" 0 0 0 "">
  <680 240 680 260 "" 0 0 0 "">
  <810 240 810 270 "" 0 0 0 "">
  <430 160 460 160 "" 0 0 0 "">
  <460 160 560 160 "Out_Detect" 540 100 37 "">
  <460 160 460 180 "" 0 0 0 "">
  <460 240 460 260 "" 0 0 0 "">
  <250 220 250 230 "" 0 0 0 "">
  <340 240 340 270 "" 0 0 0 "">
  <250 160 340 160 "" 0 0 0 "">
  <340 160 370 160 "" 0 0 0 "">
  <340 160 340 180 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
