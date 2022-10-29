<?php 
//voter=2
//candidate=3
//admin=1
$email=$_POST['email'];
$connection = new mysqli("localhost","root","","election");

$sql = "select * from user where email='$email'";

$result = mysqli_query($connection,$sql);
$arr = [];

    while($row = mysqli_fetch_array($result)){
       $arr[]=$row;
    }

// $conn->close();
print(json_encode($arr));
//echo json_encode($response);


// $conn= new mysqli("localhost","root","","election");
 
//     // $uid=$_GET["uid"];
//     $email=$_POST['email'];

          
//    $selectquery = "select * from user where email='$email' ";
//     // $selectquery = "select * from user where uid=? ";
    
//      $query = mysqli_query($conn, $selectquery);
//      $result = mysqli_fetch_assoc($query);
//      //$result = mysqli_fetch_array($query);
 
//        $image = $result['image']; 
//        $name = $result['name'];
//        $email = $result['email'];
//        $phone_no=$result['phone'];
//        $gender=$result['gender'];
//        $faculty=$result['faculty'];
//        $agenda=$result['agenda'];
//      echo json_encode(['result'=>$result]);
     ?>