<?php
    //voter=2
    //candidate=3
    //admin=1
    $connection = new mysqli("localhost","root","","election");

    //get image name
    $image = $_POST['image']; 
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone_no=$_POST['phone'];
    $gender=$_POST['gender'];
    $faculty=$_POST['faculty'];
    $imagefile = "../images/$phone_no.jpg" ;
    $imagePath="images/$phone_no.jpg";
    $filehandler = fopen($imagefile, 'wb' );
    fwrite($filehandler, base64_decode($image));
    fclose($filehandler);

    $sql = "insert into user values('','2','$name','$email','$phone_no','$gender','$faculty','$imagePath','')";
    if (mysqli_query($connection, $sql))
<<<<<<< HEAD
    {
    echo "feedback sucessufully submitted";
    }
    else
    {
    echo "Error: " . $sql . "<br>" . mysqli_error($connection);
    }
=======
{
echo "feedback sucessufully submitted";
}
else
{
echo "Error: " . $sql . "<br>" . mysqli_error($connection);
}
>>>>>>> b8a47cdbbf4643584adf9dc3f4c8f4cddb59d950
    // $result = mysqli_query($connection, "insert into user set rid='$sid', name='$name', email='$email', phone_no='$phone_no', gender='$gender', faculty='$faculty', image='$imagePath'");
   
    // if($result){
    //     echo json_encode([
    //         'message' => 'Data input successfully'
    //     ]);
    // }else{
    //     echo json_encode([
    //         'message' => 'Data Failed to input'
            
    //     ]);
    // }
?>