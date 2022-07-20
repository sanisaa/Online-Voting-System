import 'package:flutter/material.dart';
import './home.dart';

class AdminDashboard extends StatefulWidget {
  // const AdminDashboard({Key? key}) : super(key: key);
  static const routeName= '/Admin-dashboard';

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes debug banner
      home: HomePage(),
    );
  }
}