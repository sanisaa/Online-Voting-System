<?php session_start() ?>
<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;


require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

$start = $_POST['start'];
$end = $_POST['end'];

//taking time from start time
$date=strtotime("$start");
$time= date('h:ia', $date);

$connect = new mysqli("localhost","root","","election");
$mail = new PHPMailer;
              
$mail->isSMTP();
$mail->Host='smtp.gmail.com';
$mail->Port=587;
$mail->SMTPAuth=true;
$mail->SMTPSecure='tls';

$mail->Username='sendotp36@gmail.com';
$mail->Password='oxivdywbvxgutyno';

$mail->setFrom('sendotp36@gmail.com', 'Election Started');

$check= "SELECT * FROM user WHERE rid!=1";
$query = mysqli_query($connect, $check);

if(mysqli_num_rows($query) > 0) {
    while($result = mysqli_fetch_assoc($query)) {
        $mail->addAddress($result['email']);
    }

    $mail->isHTML(true);
    $mail->Subject="Election Started";
    $mail->Body="<p>Dear user, </p> <h3>The Election has started.<br></h3><h4>Start Time: $start<br> Ending Time: $end $time<br>Vote your preferred candidates before the time's out</h4>";
    if(!$mail->send()){
        echo "Failed";
    }else{
        echo "Success";  
        }
    }
    

?>



