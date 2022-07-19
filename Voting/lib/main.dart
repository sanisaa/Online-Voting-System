import 'package:flutter/material.dart';
import './login.dart';
import 'Admin/dashboard.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlineVoting',
      initialRoute: '/',
      routes: {
        // '/': (ctx) =>Login(),
        '/':(context) => AdminDashboard(),
      },
    );
  }
}