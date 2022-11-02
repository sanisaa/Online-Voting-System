<?php 
//voter=2
//candidate=3
//admin=1

$connection = new mysqli("localhost","root","","election");
 $sql="select * from user where email='$email'";
 
 $select = mysqli_query($connection, $sql);
 if(mysqli_num_rows($select)) {
		echo "failed";
    }
	else{
		echo "Success";
	}

 ?>