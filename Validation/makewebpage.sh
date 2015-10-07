#!/bin/bash

log="0"
rm -rf FullEvent
rm -rf generatorcardfile
mkdir FullEvent
mkdir generatorcardfile


cd ../compout


./compareroot ../Validation/FullEvent/ ./FullEvent.root ../output/FullEvent.root



if [ $? -eq 0 ]
then
fulleventroot=#FF0000
log=" FullEvent.root VALIDATION FAIL "
else
fulleventroot=#00FF00
fi


./compareroot ../Validation/generatorcardfile/ ./generatorcardfile.root ../output/generatorcardfile.root

if [ $? -eq 0 ]
then
gencardroot=#FF0000
log=" generatorcardfile.root VALIDATION FAIL "
else
gencardroot=#00FF00
fi

cd ../Validation



cp ../build/ts-titus/log/* ./

CLHEP=#00FF00
Geant=#00FF00
root=#00FF00
sandbox=#00FF00
fullevent=#00FF00
gencard=#00FF00

if [ ! -e ../build/CLHEP/install/bin/clhep-config ]
then
CLHEP=#FF0000
log=" CLHEP FAIL "
fi

if [ ! -e ../build/Geant4/install/bin/geant4-config ]
then
Geant=#FF0000
log=" GEANT FAIL "
fi

if [ ! -e ../build/root/bin/root ]
then
root=#FF0000
log=" ROOT FAIL "
fi

if [ ! -e ../build/ts-WChSandBox/bin/Linux-g++/WChSandBox ]
then
sandbox=#FF0000
log=" WChSandBox FAIL"
fi

if [ ! -e ../build/ts-WChSandBox/FullEvent.root ]
then
fullevent=#FF0000
log=" FullEvent.root MISSING"
fi

if [ ! -e ../build/ts-WChSandBox/generatorcardfile.root ]
then
gencard=#FF0000
log=" generatorcardfile.root MISSING"
fi

if [ $log -eq "0" ] 
then
log="SUCCESSFUL"
fi

tail -n 20 log.txt | cat log.txt
echo  `date` " : " $log >>log.txt  

echo "<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />
<title>TITUS Validation</title>
</head>

<body>
<h1 align=\"center\">TITUS Validation</h1>

<table width=\"800\" border=\"2\" align=\"center\">
<legend>Validation history</legend>
<td>

">index.html

while read line 
do
echo $line "<br>" >>index.html
done<log.txt

#echo "
#</td>
#</table>
#<p>
#<table width='800' border='0' align='center'>
#<tr>
#<td><a href='Validation.log'>Validation.log</a><p></td>
#<td><a href='PackmanDown.log'>PackmanDown.log</a><p></td>
#<td><a href='PackmanAutogen.log'>PackmanAutogen.log</a><p></td>
#<td><a href='PackmanConfigure.log'>PackmanConfigure.log</a><p></td>
#<td><a href='Setup.log'>Setup.log</a><p></td>
#<td><a href='Down_Comp.log'>Down_Comp.log</a><p></td>
#</tr>
#</table>
echo "
</td>
</table>
<p>
<table width='800' border='1' align='center'>
<tr>
<th scope='col'><div align='center'>Job Id </div></th>
<th scope='col'><div align='center'>Description</div></th>
<th scope='col'><div align'center'>Status</div></th>
</tr>

<tr>
  <td bgcolor=\""$CLHEP"\"><a href='clhep-build.log'>CLHEP</td>
  <td bgcolor=\""$CLHEP"\">Build test</td> 
  <td bgcolor=\""$CLHEP"\">" `if [ $CLHEP == "#00FF00" ] ; then  echo 'PASS';  else echo 'FAIL';  fi`"</td>
</tr>

<tr>
  <td bgcolor=\""$Geant"\"><a href='geant4-build.log'>Geant</td>
  <td bgcolor=\""$Geant"\">Build test</td>
  <td bgcolor=\""$Geant"\">" `if [ $Geant == "#00FF00" ] ;then echo 'PASS'; else echo 'FAIL'; fi`"</td>
</tr>

<tr>
  <td bgcolor=\""$root"\"><a href='root-build.log'>root</td>
  <td bgcolor=\""$root"\">Build test</td>
  <td bgcolor=\""$root"\">" `if [ $root == "#00FF00" ]; then echo 'PASS'; else echo 'FAIL' ;fi`"</td>
</tr>

<tr>
  <td bgcolor=\""$sandbox"\"><a href='ts-wchsandbox-build.log'>WChSandBox</td>
  <td bgcolor=\""$sandbox"\">Build test</td>
  <td bgcolor=\""$sandbox"\">" `if [ $sandbox == "#00FF00" ]; then echo 'PASS' ;else echo 'FAIL'; fi`"</td>
</tr>

<tr>
  <td bgcolor=\""$fullevent"\">FullEvent.root</td>
  <td bgcolor=\""$fullevent"\">File Created</td>
  <td bgcolor=\""$fullevent"\">" `if [ $fullevent == "#00FF00" ]; then echo 'PASS'; else echo 'FAIL'; fi`"</td>
</tr>


<tr>
  <td bgcolor=\""$gencard"\">generatorcardfile.root</td>
  <td bgcolor=\""$gencard"\">File Created</td>
  <td bgcolor=\""$gencard"\">" `if [ $gencard == "#00FF00" ]; then echo 'PASS' ; else echo 'FAIL'; fi`"</td>
</tr>

<tr>
  <td bgcolor=\""$fulleventroot"\"><a href='FullEvent/index.html'>FullEvent.root</td>
  <td bgcolor=\""$fulleventroot"\">Physics Validation</td>
  <td bgcolor=\""$fulleventroot"\">" `if [ $fulleventroot == "#00FF00" ]; then echo 'PASS' ; else echo 'FAIL'; fi`"</td>
</tr>

<tr>
  <td bgcolor=\""$gencardroot"\"><a href='generatorcardfile/index.html'>generatorcardfile.root</td>
  <td bgcolor=\""$gencardroot"\">Physics Validation</td>
  <td bgcolor=\""$gencardroot"\">" `if [ $gencardroot == "#00FF00" ]; then echo 'PASS' ; else echo 'FAIL'; fi`"</td>
</tr>


</table>
<h1 align='center'>&nbsp; </h1>
</body>
</html>
" >> index.html

if [ $log != "SUCCESSFUL" ]
then
echo $log | mail -s “TITUS\ VALIDATION\ ERROR!!!!” b.richards@qmul.ac.uk
fi
