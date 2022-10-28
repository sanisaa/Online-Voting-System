import 'dart:convert';

import 'package:election/user/home.dart';
import 'package:flutter/material.dart';
import '../widget/navbar.dart';
import 'package:election/widget/info_card.dart';
import 'package:flutter/material.dart';
import '../widget/info_card.dart';

import 'package:http/http.dart' as http;

class AdminDashboard extends StatefulWidget {
  var email;
  AdminDashboard(@required this.email);
  @override
  State<AdminDashboard> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Change'),
        backgroundColor: Colors.purple,
      ),
      drawer: NavBar(widget.email),
      body: MaterialApp(
        debugShowCheckedModeBanner: false, // removes debug banner
        home: HomePage(widget.email),
      ),
    );
  }
}
