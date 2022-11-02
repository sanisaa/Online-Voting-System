<?php
    $connection = new mysqli("localhost","root","","election");
   

    $sql = "select * from user where vote=0 and rid!=1";

    $result = mysqli_query($connection,$sql);
    $arr = [];

        while($row = mysqli_fetch_array($result)){
           $arr[]=$row;
        }
   print(json_encode($arr));
 
?>