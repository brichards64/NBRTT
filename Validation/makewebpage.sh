#!/bin/bash

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

for line in `more log.txt`
do
echo $line "<br>" >>index.html
done

echo "
</td>
</table>
<p>
<table width='800' border='0' align='center'>
<tr>
<td><a href='Validation.log'>Validation.log</a><p></td>
<td><a href='PackmanDown.log'>PackmanDown.log</a><p></td>
<td><a href='PackmanAutogen.log'>PackmanAutogen.log</a><p></td>
<td><a href='PackmanConfigure.log'>PackmanConfigure.log</a><p></td>
<td><a href='Setup.log'>Setup.log</a><p></td>
<td><a href='Down_Comp.log'>Down_Comp.log</a><p></td>
</tr>
</table>
<p>
<table width='800' border='1' align='center'>
<tr>
<th scope='col'><div align='center'>Job Id </div></th>
<th scope='col'><div align='center'>Description</div></th>
<th scope='col'><div align'center'>Status</div></th>
</tr>
<tr>
  <td bgcolor=\"#00FF00\">Jill</td>
  <td bgcolor=\"#00FF00\">Smith</td> 
  <td bgcolor=\"#00FF00\">50</td>
</tr>
<tr>
  <td bgcolor=\"#FF0000\">Jill</td>
  <td bgcolor=\"#FF0000\">Smith</td> 
  <td bgcolor=\"#FF0000\">50</td>
</tr>
</table>
<h1 align='center'>&nbsp; </h1>
</body>
</html>
" >> index.html

