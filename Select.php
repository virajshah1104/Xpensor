<?php

$username ='root';
$password ='';
$hostname ='localhost';
$database ='xpensor';
$localhost = mysql_connect($hostname,$username,$password) or trigger_error(mysql_error(),E_USER_ERROR);
mysql_select_db($database,$localhost);
$i=mysql_query(�SELECT * FROM personal_name�); 
$num_rows = mysql_num_rows($i);
while($row = mysql_fetch_array($i))
{
$r[]=$row;
$check=$row['Id'];
}
if($check==NULL)
{
$r[$num_rows]=�Record is not available�;
print(json_encode($r));
}
else
{
$r[$num_rows]=�success�;
print(json_encode($r));
}
mysql_close($localhost);
?>
