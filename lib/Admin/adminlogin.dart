// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:io';
import 'package:election/Admin/dashboard.dart';
import 'package:election/Admin/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../user/userlogin.dart';
//import 'verify_otp.dart';

class ALogin extends StatefulWidget {
  const ALogin({Key? key}) : super(key: key);
 
  @override
  State<ALogin> createState() => _LoginState();
}

class _LoginState extends State<ALogin> {
  TextEditingController email= TextEditingController();
  TextEditingController otp= TextEditingController();

  Future<void>sendOTP() async{

        var url="http://192.168.1.69/smtpmail/mail.php/"; 
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

        var url="http://192.168.1.69/smtpmail/verification.php/"; 
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
            new Row(
               mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
             new RaisedButton(
                      child: new Text("User"),
                      color: Colors.blue,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>Login(),),
                        )
                      ),
                  Padding(padding:  EdgeInsets.all(5.0),),
                    new RaisedButton(
                      child: new Text("Admin"),
                      color: Colors.red,
                      onPressed: ()=> Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>ALogin()),
                        )
                    ),],),
                             Padding(padding:  EdgeInsets.all(15.0),),
          Text(" Admin Login", 
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
                        
              
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: otp,
                      decoration:InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the otp'),

                        
                        
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