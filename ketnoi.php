<?php
$fcn = mysqli_connect("localhost", "root", "");
$csdl = mysqli_select_db($fcn, "online_shop");
mysqli_query($fcn, query: "SET NAME 'utf8'");
?>