<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-154,1441,686,0.909092,0,0>
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
  <.SW SW2 0 1010 270 0 73 0 0 "TR1" 1 "lin" 1 "Pin_dBm" 1 "11" 1 "28" 1 "18" 1>
  <C C1 1 560 210 17 -26 0 1 "100pF" 1 "" 0 "neutral" 0>
  <R R1 1 660 210 15 -26 0 1 "1kOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Diode D_HSMS2822_1 1 500 160 -26 -32 0 2 "2.2e-8" 0 "1.08" 0 "0.7" 0 "0.5" 0 "0.7" 0 "0.5" 0 "0" 0 "0" 0 "2" 0 "6" 0 "7.2n" 0 "0" 0 "0" 0 "1" 0 "1" 0 "15" 0 "10e-4" 0 "26.85" 0 "3.0" 0 "1.11" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "26.85" 0 "1.0" 0 "normal" 0>
  <GND * 1 440 250 0 0 0 0>
  <R R2 1 240 160 -26 15 0 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Vac V1 1 140 210 18 -26 0 1 "Vin" 1 "freq" 0 "0" 0 "0" 0>
  <GND * 5 140 260 0 0 0 0>
  <L L1 1 380 160 -26 10 0 0 "9.9 nH" 1 "" 0>
  <C C2 1 440 220 17 -26 0 1 "1.5 pF" 1 "" 0 "neutral" 0>
  <Eqn Eqn3 1 1060 490 -30 16 0 0 "Pin_dBm=0" 1 "yes" 0>
  <Eqn Eqn2 1 900 490 -30 16 0 0 "freq=915*10^6" 1 "yes" 0>
  <.TR TR1 1 880 100 0 73 0 0 "lin" 1 "0" 1 "100n" 1 "150000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
</Components>
<Wires>
  <660 160 660 180 "" 0 0 0 "">
  <660 240 660 260 "" 0 0 0 "">
  <560 160 660 160 "Output" 670 130 76 "">
  <530 160 560 160 "" 0 0 0 "">
  <560 160 560 180 "" 0 0 0 "">
  <560 240 560 260 "" 0 0 0 "">
  <140 240 140 260 "" 0 0 0 "">
  <140 160 140 180 "" 0 0 0 "">
  <140 160 210 160 "" 0 0 0 "">
  <270 160 350 160 "Input" 330 130 27 "">
  <410 160 440 160 "" 0 0 0 "">
  <440 160 470 160 "" 0 0 0 "">
  <440 160 440 190 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
