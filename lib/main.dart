import 'package:flutter/material.dart';
import 'Admin/dashboard.dart';
import 'package:get/get.dart';
import 'user/userlogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnlineVoting',
      initialRoute: '/',
      routes: {
        '/': (ctx) => Login(),
        //  '/': (context) => AdminDashboard(),
      },
    );
  }
}
