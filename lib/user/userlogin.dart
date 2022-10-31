// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:io';
import 'package:election/Admin/adminlogin.dart';
import 'package:election/api.dart';
import 'package:election/user/dashboard.dart';
import 'package:election/Admin/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
//import 'verify_otp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController otp = TextEditingController();

      Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: Text('Yes',),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),

            ],
          ),
        ) ??
        false;
    }

  Future<void> sendOTP() async {
    var url = "$uri/smtpmail/user_mail.php/";
    final response = await http.post(Uri.parse(url), body: {
      'email': email.text,
    });

    var data = json.decode(json.encode(response.body));

    print(data);
    if (data.compareTo("NotRegistered") == -1) {
      print("you are not registered");
      showSuccessSnackBar(Text("This email has not been registered"));
      // Navigator.push(context, MaterialPageRoute(builder:(context) => Login()));
    } else if ((data.compareTo("Success") == 1)) {
      print("OTP sent");
      showSuccessSnackBar(Text("OTP Sent! Please check your email"));
      //Navigator.push(context, MaterialPageRoute(builder:(context) => VerifyOTPScreen()));
    } else {
      print("invalid email");
      showSuccessSnackBar(Text("Invalid Email"));
    }
  }

  Future<void> verify() async {
    var url = "$uri/smtpmail/verification.php/";
    final response = await http.post(Uri.parse(url), body: {
      'otp_code': otp.text,
    });

//         print(response.statusCode);
//         if (response.statusCode == 200) {

    var data = jsonDecode(json.encode(response.body));
    print(data);
    String message = "Success";
    if (data.compareTo("Success") == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AdminDashboard(email.text)));
    } else {
      print("Invalid OTP");
      showSuccessSnackBar(Text("Invalid OTP! Try Again"));
    }
  }

  showSuccessSnackBar(message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: message,
      backgroundColor: Color.fromARGB(178, 0, 0, 0),
      //margin: EdgeInsets.all(20),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Container(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 50,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 12,
                  ),
                  color: Colors.purple,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 12,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new ElevatedButton(
                                child: new Text("User"),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.purple),
                                onPressed: () => Navigator.of(context).push(
                                      new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Login(),
                                      ),
                                    )),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),
                            new ElevatedButton(
                                child: new Text("Admin"),
                                style:
                                    ElevatedButton.styleFrom(primary: Colors.red),
                                onPressed: () => Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ALogin()),
                                    )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
                        Text(
                          " User Login",
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: TextFormField(
                                  cursorColor: Colors.purple,
                                  controller: email,
                                  decoration: InputDecoration(
                                      fillColor: Colors.purple,
                                      border: OutlineInputBorder(),
                                      label: Text('Enter the email'),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.send),
                                        tooltip: "Send OTP",
                                        onPressed: sendOTP,
                                        color: Colors.purple.shade400,
                                      )),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: TextFormField(
                                    controller: otp,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text('Enter the otp'),
                                    ),
                                  )),
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.purple),
                                  onPressed: () {
                                    verify();
                                  },
                                  child: const Text('Verify'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
