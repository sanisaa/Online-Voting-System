<?php
    //voter=2
    //candidate=3
    //admin=1
    $connection = new mysqli("localhost","root","","election");
    if ($connection){
        print("connection successful");
    }else{
        print("not connected");
    }

  
    // check the status 
    $status=$_POST['status'];
    $vote=0;
    print("status during conn $status");
    $sql = "UPDATE poll SET status='$status'";
    //"insert into updat values($status)";
    if (mysqli_query($connection, $sql))
{
echo "feedback sucessufully submitted";
}
else
{
echo "Error: " . $sql . "<br>" . mysqli_error($connection);
}

?>