import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminDashboard extends StatefulWidget {
  // const AdminDashboard({Key? key}) : super(key: key);
  static const routeName= '/Admin-dashboard';

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Change'),
        backgroundColor: Colors.purple,

      ),
      body: Card(

      ),
      
    );
  }
}