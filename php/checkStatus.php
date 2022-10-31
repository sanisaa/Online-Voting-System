<?php


$connection = new mysqli("localhost","root","","election");
   

$sql = "SELECT status FROM poll WHERE sid=1";


$result = mysqli_query($connection,$sql);

$status = $result->fetch_array()[0] ?? '';
if(strcmp($status,'1')==0){
    echo ("succcess");
}else{
    echo("NotRegistered");
// echo json_encode($status);
   


}

//     $result = mysqli_query($connection,$sql);
//     $arr = [];

//         while($row = mysqli_fetch_array($result)){
//            $arr[]=$row;
//         }
    
//    // $conn->close();
//    print(json_encode($arr));
//     //echo json_encode($response);
 
?>