import 'dart:convert';
import 'dart:io';
import 'package:election/voters.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'verify_otp.dart';


class Login extends StatefulWidget {
  //const addNewVoter({Key? key}) : super(key: key);
 
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController email= TextEditingController();


  Future<void>login() async{

        var url="http://192.168.1.69/smtpmail/mail.php/"; 
         final response=await http.post(Uri.parse(url),
          body: {  
          'email': email.text,
        }
        );

       var data=json.decode(json.encode(response.body));
       String d = data;
       print(d);
         if(d=="NotRegistered"){
           print("you are not registered");
          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
         }else if (d!="Success"){
          print("OTP sent");
           Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOTPScreen()));
        }else {
          print("Invalid Email");
          print("Failed");
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
        }
      }
     
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: 
          AppBar(
              title: const Text('Insert Voter'),
                centerTitle: true,
                backgroundColor: Colors.purple,
          ),
        body: SingleChildScrollView(
         
          child: Column( 
            
            children: [
                        
              
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the email'),
                      ), 
                    ),
                  ),
        
                    
                    Container(
                      margin:const  EdgeInsets.all(10),
                      child: ElevatedButton(onPressed: (){
                        login();
                      },
                      child: const Text('Send Otp'),
                      
                      ),
                      
                    ),
               
                  
                    
                    ],),),
        );
    
  }
}