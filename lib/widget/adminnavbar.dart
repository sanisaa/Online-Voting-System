import 'package:election/Admin/dashboard.dart';
import 'package:election/Admin/startend.dart';
import 'package:election/admin/adminlogin.dart';
import 'package:election/admin/lists/ballot.dart';
import 'package:flutter/material.dart';
import '../Admin/lists/candiates.dart';
import '../Admin/lists/voters.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NavBar extends StatefulWidget {
  var email;
  NavBar(this.email, {Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // const NavBar({Key? key}) : super(key: key);

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    //doesnot show side bar when pressed back button from pages

    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdminDashboard(widget.email),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CandidateList(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VotersList(),
          ),
        );
        break;
      case 3:
              Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StartEnd(widget.email),
          ),
        );

        break;
        case 4:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Ballot(widget.email),
          ),
        );
        break;
      case 5:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ALogin()),
            (Route<dynamic> route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //remove padding
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('profile'),
            onTap: () => selectedItem(context, 0),
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Candidates'),
            onTap: () => selectedItem(context, 1),
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Voters'),
            onTap: () => selectedItem(context, 2),
          ),
          ListTile(
            leading: const Icon(Icons.start),
            title: const Text('conduct Election'),
            onTap: () => selectedItem(context, 3),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Ballot'),
            onTap: () => selectedItem(context, 4),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('logout'),
            onTap: () => selectedItem(context, 5),
          ),
        ],
      ),
    );
  }
}
