import 'dart:convert';

import 'package:election/Admin/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
//import 'package:sms_autofill/sms_autofill.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
 TextEditingController otp = new TextEditingController();
 
 Future<void>verify() async{

        var url="http://192.168.1.69/smtpmail/verification.php/"; 
         final response=await http.post(Uri.parse(url),
          body: {  
            
          'otp_code': otp.text,
                   
        }
        );

        
//         print(response.statusCode);
//         if (response.statusCode == 200) {
   var data=json.decode(json.encode(response.body));
   if(data== "Success"){
          print(data);
             Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminDashboard()),
      );
    
        }else{
          print("Invalid OTP");
        }

 }

      
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: otp,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Enter the otp')), 
                      ),
                  ),
                    
              const SizedBox(
              height: 20,
            ),
           Container(
                      margin:const  EdgeInsets.all(10),
                      child: ElevatedButton(onPressed: (){
                        verify();
                      },
                      child: const Text('Verify'),
                      
                      ),
                      
                    ),

          ],
        ),
      ),
    );
  }
}