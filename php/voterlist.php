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
?>