import 'package:election/api.dart';
import 'package:election/user/dashboard.dart';
import 'package:election/user/diablepage.dart';
import 'package:election/user/lists/votefor.dart';
import 'package:election/user/userlogin.dart';
import 'package:flutter/material.dart';
import '../user/lists/ballot.dart';
import '../user/lists/candiates.dart';
import '../user/lists/votes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// import '../startend (2).dart';
// import '../startend.dart';

class NavBar extends StatefulWidget {
  var email;
  NavBar(this.email, {Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // const NavBar({Key? key}) : super(key: key);
  var status;

  Future<void> deleteotp() async {
    String url = "$uri/voting/php/otpdelete.php/";
    var response = await http.post(Uri.parse(url), body: {
      'email': widget.email,
    });
  }

  Future<String> verify() async {
    String url = "$uri/voting/php/checkStatus.php/";

    var response = await http.get(Uri.parse(url));
    status = await json.decode(json.encode(response.body));
    return status;
  }

  void enableBallot() {
    if (status.compareTo("NotRegistered") == 1) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VoteFor(widget.email),
      ));
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DisablePage(widget.email)));
    }
  }
    void enableVOtes() {
    if (status.compareTo("NotRegistered") == 0) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Votes(),
      ));
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DisablePage(widget.email)));
    }
  }

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
        enableVOtes();
        break;
      case 3:
        enableBallot();
        break;
      case 4:
      deleteotp();
            Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false);
        break;
    }
  }

  @override
  void initState() {
    verify();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //remove padding
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
          accountName:  const Text('Electiva'),
         accountEmail:   Text(widget.email),
         currentAccountPicture: CircleAvatar(
          child: ClipOval(
            child: Image.asset('assets/images/logo.png',
            fit: BoxFit.cover,
            width: 90,
            height: 90,
            ),
          ), 
          ),
          decoration: const BoxDecoration(
            color:Colors.purple,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banner.png'),
              ),
          ),
         ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('profile'),
            onTap: () => selectedItem(context, 0),
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt_1_rounded),
            title: const Text('Candidates'),
            onTap: () => selectedItem(context, 1),
          ),
          ListTile(
            leading: const Icon(Icons.pages),
            title: const Text('Votes'),
            onTap: () => selectedItem(context, 2),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Ballot'),
            onTap: () => selectedItem(context, 3),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('logout'),
            onTap: () => selectedItem(context, 4),
          ),
          //       ListTile(
          // leading:const Icon(Icons.description),
          // title: const Text('start'),
          // onTap: ()=> selectedItem(context ,5),
          // ),
        ],
      ),
    );
  }
}
