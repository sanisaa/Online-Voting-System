// ignore_for_file: unnecessary_new
//
import 'dart:convert';
import 'package:election/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Ballot extends StatefulWidget {
  // Ballot({Key? key}) : super(key: key);

  var email;
  Ballot(@required this.email);
  @override
  State<Ballot> createState() => _BallotState();
}

class _BallotState extends State<Ballot> {
  List userdata = [];
  Future<List> getrecord() async {
    String url = "$uri/voting/php/candidatelist.php/";
    //  String uri = "http://192.168.1.69/voting/php/candidatelist.php/";
    try {
      var response = await http.get(Uri.parse(url));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
    return userdata;
  }

  @override
  void initState() {
    getrecord();
    super.initState();
  }

  Future castVote(uid, name) async {
    String url = "$uri/voting/php/votingcondition.php/";
    //  String uri = "http://192.168.1.69/voting/php/candidatelist.php/";
    try {
      var userresponse = await http.post(Uri.parse(uri), body: {
        'email': widget.email,
      });
      var data = json.decode(json.encode(userresponse.body));
      print(data);
      if (data.compareTo('0') != 0) {
        print("you have already voted");
        showSuccessSnackBar(Text('You have already voted'));
      } else {
        try {
          String url = "$uri/voting/php/vote.php/";
          //  String uri = "http://192.168.1.69/voting/php/candidatelist.php/";
          var response = await http.post(Uri.parse(url), body: {
            'uid': uid,
            'name': name,
          });
          var data = json.decode(json.encode(response.body));
          if (data != "data insertion Success") {
            print(data);
          } else {
            print("Success");
          }
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void confirm(uid, name) {
    AlertDialog alertDialog = new AlertDialog(
      // ignore: prefer_interpolation_to_compose_strings
      content: new Text("Are You sure want to vote " + name),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text(
            "Yes! vote",
            style: new TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          onPressed: () {
            AlertDialog alertDialog =
                new AlertDialog(content: new Text("voted successfully"));
            castVote(uid, name);
          },
        ),
      ],
    );

    //showDialog(context: context, child: alertDialog);
    showDialog(builder: (context) => alertDialog, context: context);
  }

  showSuccessSnackBar(message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: message,
      backgroundColor: Colors.purple,
      //margin: EdgeInsets.all(20),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cast your vote'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          // itemCount: userdata.length,
          itemCount: userdata == null ? 0 : userdata.length,
          itemBuilder: (context, index) {
            String image = userdata[index]['image'];
            var uid = userdata[index]['uid'];
            var name = userdata[index]['name'];
            return Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  minRadius: 10,
                  maxRadius: 50,
                  // radius: 20,
                  child: ClipOval(
                    child: Image.network(
                      '$uri/voting/$image',
                      //  'http://192.168.1.69/voting/$image',
                      width: 60,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                trailing: ElevatedButton(
                    child: new Text("Vote"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      confirm(uid, name);
                    }),
                title: Text(userdata[index]["name"]),
                subtitle: Text(userdata[index]["email"]),
              ),
            );
          }),
    );
  }
}
