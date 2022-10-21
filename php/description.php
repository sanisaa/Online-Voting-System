

<?php 
     $connection = new mysqli("localhost","root","","election");
 
    // $uid=$_GET["uid"];
    $uid=(int) $_POST['uid'];

          
   // $selectquery = "select * from user where uid='$uid' ";
    $selectquery = "select * from user where uid=? ";
    
     $query = mysqli_query($conn, $selectquery);
     $result = mysqli_fetch_assoc($query);
     //$result = mysqli_fetch_array($query);
 
       $image = $result['image']; 
       $name = $result['name'];
       $email = $result['email'];
       $phone_no=$result['phone'];
       $gender=$result['gender'];
       $faculty=$result['faculty'];
       $agenda=$result['agenda'];
     echo json_encode(['result'=>$result]);

    //    print(json_encode($image));
    //    print(json_encode($name));
    //    print(json_encode($email));
    //    print(json_encode($phone_no));
    //    print(json_encode($gender));
    //    print(json_encode($faculty));
    //    print(json_encode($agenda));




    //button ma flutter section ma yesto code halnu parxa
    
    
 ?>


