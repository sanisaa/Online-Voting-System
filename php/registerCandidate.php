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
    $agenda=$_POST['agenda'];
    $imagefile = "../images/$phone_no.jpg" ;
    $imagePath="images/$phone_no.jpg";
    $filehandler = fopen($imagefile, 'wb' );
    fwrite($filehandler, base64_decode($image));
    fclose($filehandler);

    $sql = "insert into user values('','3','$name','$email','$phone_no','$gender','$faculty','$imagePath','$agenda')";
if (mysqli_query($connection, $sql))
{
echo "feedback sucessufully submitted";
}
else
{
echo "Error: " . $sql . "<br>" . mysqli_error($connection);
}

?>