<?php 
$connection = new mysqli("localhost","root","","election");
$vote=0;

 $sql="SELECT * FROM user WHERE vote=0 AND rid!=1";
 
 $select = mysqli_query($connection, $sql);
 $rowcount=mysqli_num_rows($select);
 echo($rowcount);
//  if($rowcount){
// 		echo "Success";
//     }
// 	else{
// 		echo "failed";
// 	}

 ?>