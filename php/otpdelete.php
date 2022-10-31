<?php
 $connect = new mysqli("localhost","root","","election");

 $email=$_POST['email'];
 $sql="DELETE FROM otp WHERE email='$email'";
 if (mysqli_query($connect, $sql)){
    echo("success");
 }else{
    echo("failed");
 }

?>