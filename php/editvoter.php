<?php

$connection = new mysqli("localhost","root","","election");
	
	$uid = $_POST['uid'];
    $rid = $_POST['rid'];
    $image = $_POST['image']; 
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone=$_POST['phone'];
    $gender=$_POST['gender'];
    $faculty=$_POST['faculty'];
    $imagefile = "../images/$phone.jpg" ;
    $imagePath="images/$phone.jpg";
    $filehandler = fopen($imagefile, 'wb' );
    fwrite($filehandler, base64_decode($image));
    fclose($filehandler);

	
	$sql="UPDATE user SET name='".$name."', email='".$email."', phone='".$phone."', gender='".$gender."',faculty='".$faculty."', image='".$imagePath."', agenda='' WHERE uid=". $uid;
    if (mysqli_query($connection, $sql)){
        echo "Successful";
        }
        else
        {
        echo "Error: " . $sql . "<br>" . mysqli_error($connection);
        }

?>