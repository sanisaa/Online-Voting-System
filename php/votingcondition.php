<?php 
//voter=2
//candidate=3
//admin=1

 $connect = new mysqli("localhost","root","","election");
 $email=$_POST['email'];
 $sql = "SELECT vote FROM user WHERE email='$email'";
 $query = mysqli_query($connect, $sql);
 $result = mysqli_fetch_assoc($query);
   $status = $result['vote']; 
 if (mysqli_query($connect, $sql))
    {
    if(strcmp($status,'0')==0){   
        echo($status); 
        $update_status= "UPDATE user SET vote=vote+1 WHERE email='$email'";
        $updatesql=mysqli_query($connect, $update_status);
        }else{
            echo($status);
        }
    }else{
        echo("failed");
    }


// $email=$_POST['email'];
// $connection = new mysqli("localhost","root","","election");

// $sql = "select * from user where email='$email'";

// $result = mysqli_query($connection,$sql);
// $arr = [];

//     while($row = mysqli_fetch_array($result)){
//        $arr[]=$row;
//        $vote=arr['vote'];
//     }

// print(json_encode($arr));

     ?>