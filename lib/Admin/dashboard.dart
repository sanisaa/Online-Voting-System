import 'package:flutter/material.dart';
import './home.dart';
import '../widget/navbar.dart';

class AdminDashboard extends StatefulWidget {
  // const AdminDashboard({Key? key}) : super(key: key);
  static const routeName = '/Admin-dashboard';

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Change'),
        backgroundColor: Colors.purple,
      ),
<<<<<<< HEAD
      drawer: NavBar(),
      body: MaterialApp(
        debugShowCheckedModeBanner: false, // removes debug banner
=======
      drawer:NavBar(),

      body:MaterialApp(
         debugShowCheckedModeBanner: false,// removes debug banner not working rn
>>>>>>> 1926097acdca18e68799d7c7e1307976243e271a
        home: HomePage(),
      ),
    );
  }
}
