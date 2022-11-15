<?php session_start() ?>
<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;


require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

$connect = new mysqli("localhost","root","","election");


$email = $_POST['email'];
$check= "SELECT * FROM user WHERE rid=1 AND email='$email'";
$query = mysqli_query($connect, $check);
$result = mysqli_fetch_assoc($query);
$e = $result['email']; 
$uid = $result['uid'];
if($email== $e){
    $mail = new PHPMailer(true);
    $otp = rand(100000,999999);
    $_SESSION['otp'] = $otp;
    $_SESSION['mail'] = $email;
    $mail = new PHPMailer;
              
    $mail->isSMTP();
    $mail->Host='smtp.gmail.com';
    $mail->Port=587;
    $mail->SMTPAuth=true;
    $mail->SMTPSecure='tls';

    $mail->Username='sendotp36@gmail.com';
    $mail->Password='oxivdywbvxgutyno';

    $mail->setFrom('sendotp36@gmail.com', 'OTP Verification');
    $mail->addAddress($_POST["email"]);

    $mail->isHTML(true);
    $mail->Subject="Your verify code";
    $mail->Body="<p>Dear user, </p> <h3>Your verify OTP code is $otp <br></h3>";
    if(!$mail->send()){
        echo "Failed";
    }else{
        
        $result = mysqli_query($connect, "INSERT INTO otp (uid,email,otp_code) VALUES ('$uid','$email','$otp')");
        echo "Success";  
        }
    } else {
    echo "NotRegistered";
    $connect->close();     
            }
    

?>



