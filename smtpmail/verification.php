<?php session_start() ?>
<?php 
   $connect = new mysqli("localhost","root","","election");
   $otp_code = $_POST['otp_code'];
   
   $connect ->query("UPDATE otp SET otp='$otp_code' WHERE otp_code=".$otp_code);
   $selectquery = "select * from otp where otp_code=".$otp_code;
    
   $query = mysqli_query($connect, $selectquery);
   $result = mysqli_fetch_assoc($query);
   $otp = $result['otp']; 
   //print($otp);

if($otp == $otp_code){
  print("Success");
}else{
  echo"Not Success";
  
}







?>

