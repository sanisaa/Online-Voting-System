<<<<<<<< HEAD:php/totalvoters_count.php
<?php 
$connection = new mysqli("localhost","root","","election");
//$vote=0;
========
<?php
    //voter=2
    //candidate=3
    //admin=1
    $connection = new mysqli("localhost","root","","election");
   
>>>>>>>> dbc59055cbbb646a0475b0b477e8b00a8603151d:php/totalvoters.php

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