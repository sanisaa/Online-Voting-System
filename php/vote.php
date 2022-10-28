<?php
 $connect = new mysqli("localhost","root","","election");
 $uid=$_POST['uid'];
 $name=$_POST['name'];
 $sql = "UPDATE result SET vote_count=vote_count+1 WHERE uid=".$uid;
 if (mysqli_query($connect, $sql))
    {
    echo("voted successfully");
    }else{
        echo("failed");
    }
?>