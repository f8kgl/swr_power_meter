<Qucs Schematic >
<Properties>
  <View=0,0,945,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=i_v_bas70.dat>
  <DataDisplay=i_v_bas70.dpl>
  <OpenDisplay=1>
  <Script=i_v_bas70.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Titre>
  <FrameText1=Auteur :>
  <FrameText2=Date :>
  <FrameText3=Version :>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Diode D_BAS70_1 1 520 130 13 -26 0 1 "99.5p" 0 "1.7" 0 "2p" 0 "0.333" 0 "0.7" 0 "0.5" 0 "0" 0 "0" 0 "2" 0 "0.6" 0 "7.2n" 0 "0" 0 "0" 0 "1" 0 "1" 0 "70" 0 "10u" 0 "26.85" 0 "3.0" 0 "1.11" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "26.85" 0 "1.0" 0 "normal" 0>
  <Idc I1 1 360 130 18 -26 0 1 "Id" 1>
  <GND * 5 520 190 0 0 0 0>
  <GND * 5 360 190 0 0 0 0>
  <.DC DC1 1 660 90 0 77 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.SW SW1 1 670 240 0 77 0 0 "DC1" 1 "log" 1 "Id" 1 "1e-5" 1 "20e-3" 1 "331" 1>
</Components>
<Wires>
  <360 80 360 100 "" 0 0 0 "">
  <360 80 520 80 "Vd" 530 50 139 "">
  <520 80 520 100 "" 0 0 0 "">
  <360 160 360 190 "" 0 0 0 "">
  <520 160 520 190 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
