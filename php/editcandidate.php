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
    $agenda=$_POST['agenda'];
    $imagefile = "../images/$phone.jpg" ;
    $imagePath="images/$phone.jpg";
    $filehandler = fopen($imagefile, 'wb' );
    fwrite($filehandler, base64_decode($image));
    fclose($filehandler);

	$sql="UPDATE user SET name='".$name."', email='".$email."', phone='".$phone."', gender='".$gender."',faculty='".$faculty."', image='".$imagePath."', agenda='$agenda' WHERE uid=". $uid;
    if (mysqli_query($connection, $sql)){
        echo "Successful";
        $selectquery = "select * from user where phone=".$phone;
        $query = mysqli_query($connection, $selectquery);
        $result = mysqli_fetch_assoc($query);
        $uid = $result['uid']; 
        $table=mysqli_query($connection,"UPDATE  vote SET name='.$name' WHERE uid=".$uid);
        }
        else
        {
        echo "Error: " . $sql . "<br>" . mysqli_error($connection);
        }

?>