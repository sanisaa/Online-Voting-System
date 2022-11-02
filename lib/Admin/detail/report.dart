import 'package:election/Admin/lists/totalusers.dart';
import 'package:election/Admin/lists/unvoteduser.dart';
import 'package:election/Admin/lists/voteduser.dart';
import 'package:election/admin/lists/ballot.dart';
import 'package:election/api.dart';
import 'package:election/widget/adminnavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Report extends StatefulWidget {
    
    var email;
  Report(@required this.email);
    @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  var voted;
  var totalvoter;
  var vleft;


  Future<void> getrecord() async {
    String url = "$uri/voting/php/votedusers_count.php/";
    //String url = "$uri/voting/php/totalvoters.php/";
    final response = await http.get(Uri.parse(url));
    voted = json.encode(json.decode(response.body));
    print(voted);
    setState(() {
      return voted;
    });
  }

  Future<void> getrecordd() async {
    String url = "$uri/voting/php/unvotedusers_count.php/";
    //String url = "$uri/voting/php/totalvoters.php/";
    final response = await http.get(Uri.parse(url));
    vleft = json.encode(json.decode(response.body));
    print(vleft);
    setState(() {
      return voted;
    });
  }

  Future<void> records() async {
    String url = "$uri/voting/php/totalvoters_count.php/";
    final response = await http.get(Uri.parse(url));
    totalvoter = json.encode(json.decode(response.body));
    print(totalvoter);
    //getrecord();
    if (totalvoter != null) {
      print(totalvoter);
      setState(() {
        getrecordd();
        getrecord();
        return totalvoter;
      });
    } else {
      print("Failed");
    }
  }

  @override
  void initState() {
    records();
    //getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Card'),
        backgroundColor: Colors.purple,
      ),
      drawer: NavBar(widget.email),
      body: Column(
        children: [
          Card(
                elevation: 10,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("Total number of voters: $totalvoter",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing:  Icon(Icons.arrow_forward),
                  // subtitle: Text(userdata[index]["agenda"],style: TextStyle(fontWeight: FontWeight.w200),),
              onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new TotalVoter())),
                ), 
                ),
                Card(
                elevation: 10,
                margin: EdgeInsets.all(10),
                  child:ListTile(
                  title: Text("Number of users who already voted: $voted",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing:  Icon(Icons.arrow_forward),
                  onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new VotedUser())),
                  )
                ),
                Card(
                elevation: 10,
                margin: EdgeInsets.all(10),
                  child:ListTile(
                  title: Text("Number of Users left to vote: $vleft",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing:  Icon(Icons.arrow_forward),
                  onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new UnvotedUser())),
                  )
                ),
        ],
      )
      );
  }
}