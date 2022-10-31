<?php
    //voter=2
    //candidate=3
    //admin=1
    $connection = new mysqli("localhost","root","","election");
    $sql = "SELECT * FROM user INNER JOIN vote ON user.uid=vote.uid";

    $result = mysqli_query($connection,$sql);
    $arr = [];

        while($row = mysqli_fetch_array($result)){
           $arr[]=$row;
        }
    
   // $conn->close();
   print(json_encode($arr));
    //echo json_encode($response);
 
?>