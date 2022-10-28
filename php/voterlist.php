<?php
    //voter=2
    //candidate=3
    //admin=1
    $connect = new mysqli("localhost","root","","election");
   

    //$sql = "select * from user where rid=2";
    $queryResult=$connect->query("SELECT * FROM user WHERE rid=2");
    $result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);


//     $result = mysqli_query($connection,$sql);
//     $arr = [];

//         while($row = mysqli_fetch_array($result)){
//            $arr[]=$row;
//         }
    
//    // $conn->close();
//    print(json_encode($arr));
//     //echo json_encode($response);
 
?>