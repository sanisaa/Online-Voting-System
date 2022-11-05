<?php 
$connection = new mysqli("localhost","root","","election");
$vote=0;

 $sql="SELECT * FROM user WHERE rid=3";
 
 $select = mysqli_query($connection, $sql);
 $rowcount=mysqli_num_rows($select);
 echo($rowcount);
 ?>