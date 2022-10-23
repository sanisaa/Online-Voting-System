import 'dart:convert';
import 'dart:io';
import 'package:election/Admin/home.dart';
import 'package:election/voters.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Admin/dashboard.dart';
//import 'verify_otp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
 
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email= TextEditingController();
  TextEditingController otp= TextEditingController();

  Future<void>sendOTP() async{

        var url="http://192.168.1.67/smtpmail/mail.php/"; 
         final response=await http.post(Uri.parse(url),
          body: {  
          'email': email.text,
        }
        );

       var data=json.decode(json.encode(response.body));
       
       print(data);
         if(data.compareTo("NotRegistered")==1){
           print("you are not registered");
         // Navigator.push(context, MaterialPageRoute(builder:(context) => Login()));
         }else if((data.compareTo("Success")==1)){
          print("OTP sent");
           //Navigator.push(context, MaterialPageRoute(builder:(context) => VerifyOTPScreen()));
      }else{
        print("invalid email");
      }
     
  }
  Future<void>verify() async{

        var url="http://192.168.1.67/smtpmail/verification.php/"; 
         final response=await http.post(Uri.parse(url),
          body: {  
            
          'otp_code': otp.text,
                   
        }
        );

        
//         print(response.statusCode);
//         if (response.statusCode == 200) {
 
   var data=jsonDecode(json.encode(response.body));
   print(data);
   String message="Success";
   if(data.compareTo("Success")==1){
          Navigator.push(context, MaterialPageRoute(builder:(context) => AdminDashboard(email.text)));
        }else{
         print("Invalid OTP");
         }

 }
 Future<void>login() async{
 }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          ),
          child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Login", 
          style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Color.fromARGB(255, 6, 92, 161),
            fontWeight:FontWeight.bold,
            ),
          ),
        SingleChildScrollView(
          child: Column(children: [
                    Container(
                 margin: const EdgeInsets.all(10),
                  child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the email'),
                        suffixIcon: IconButton(icon: Icon(Icons.send),
                        tooltip: "Send OTP",
                        onPressed: sendOTP,
                        )), 
                     
                    ),
                        
                 //  TextButton(onPressed: () {}, child: Text("Send OTP"),),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: otp,
                      decoration:InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the otp'),
                        //  suffixIcon: IconButton(icon: Icon(Icons.send),
                        // tooltip: "Verify",
                        // onPressed: verify), 
                        
                        
                      ),
                  )),
      
                    
                    Container(
                      margin:const  EdgeInsets.all(10),
                      child: ElevatedButton(onPressed: (){
                        verify();
                      },
                      child: const Text('Verify'),
                      ), 
                    ),
               
                  
                    
                    ],),),]),
            ));
    
  }
}