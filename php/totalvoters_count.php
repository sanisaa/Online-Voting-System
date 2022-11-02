
<?php 
$connection = new mysqli("localhost","root","","election");


    $sql = "select * from user where rid!=1";

    $result = mysqli_query($connection,$sql);
    $arr = [];
        while($row = mysqli_fetch_array($result)){
           $arr[]=$row;
        }
    
   // $conn->close();
   print(json_encode($arr));
    //echo json_encode($response);
 
?>