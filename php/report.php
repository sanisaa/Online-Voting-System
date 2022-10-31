<?php 
//voter=2
//candidate=3
//admin=1
$email=$_POST['email'];
$connection = new mysqli("localhost","root","","election");

$sql = "select * from user";

$result = mysqli_query($connection,$sql);
$arr = [];

    while($row = mysqli_fetch_array($result)){
       $arr[]=$row;
    }
print(json_encode($arr));

     ?>