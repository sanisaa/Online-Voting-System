<?php
 $connect = new mysqli("localhost","root","","election");

 $uid=$_POST['uid'];
 $connect->query("DELETE FROM user WHERE uid=".$uid);
?>