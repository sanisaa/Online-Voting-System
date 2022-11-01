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
    //  String uri = "http://192.168.1.66/voting/php/candidatelist.php/";
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
                      //  'http://192.168.1.66/voting/$image',
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
                    showSuccessSnackBar(Text("You are Admin, You cannot vote!"));
                    }),
                title: Text(userdata[index]["name"]),
                subtitle: Text(userdata[index]["agenda"]),
              ),
            );
          }),
    );
  }
}
