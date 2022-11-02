import 'dart:convert';
import 'package:election/api.dart';
import 'package:election/widget/adminnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class StartEnd extends StatefulWidget {
  // const StartEnd({Key? key}) : super(key: key);
  var email;
  StartEnd(this.email, {Key? key}) : super(key: key);

  @override
  State<StartEnd> createState() => _StartEndState();
}

class _StartEndState extends State<StartEnd> {
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  late int status;

  Future<void> notify() async {
    var url = "$uri/smtpmail/notification.php/";
    final response = await http.post(Uri.parse(url), body: {
      'start': start.text,
      'end': end.text,
    });

    var data = json.decode(json.encode(response.body));

    print(data);
    print(data.compareTo("Success"));
    print(data.compareTo("Failed"));

    if ((data.compareTo("Success") == 1)) {
      print("Mail sent");
      showSuccessSnackBar(Text("Mail Sent"));
    } else {
      print("failed");
      showSuccessSnackBar(Text("There was an error"));
    }
  }

  Future<void> insertstatus() async {
    var url = "$uri/voting/php/updateStatus.php/";
    final response =
        await http.post(Uri.parse(url), body: {'status': status.toString()});
    var data = json.decode(json.encode(response.body));
    if (data != "data insertion Success") {
      showSuccessSnackBar(Text(""));
      print(data);
    } else {
      print("Success");
      showSuccessSnackBar(Text(""));
    }
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
          title: const Text("StartElection"), backgroundColor: Colors.purple),
      drawer: NavBar(widget.email),
      body: Material(
          child: Container(
              margin: EdgeInsets.only(top: 200),
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: start,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Start Time')),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: end,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text('End Time')),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      primary: Colors.green,
                      minimumSize: Size.fromHeight(40),
                    ),
                    onPressed: () {
                      status = 1;
                      // print(status);
                      insertstatus();
                      notify();
                    },
                    child: Text(
                      'StartElection',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      primary: Colors.red,
                      minimumSize: Size.fromHeight(40),
                    ),
                    onPressed: () {
                      status = 0;
                      insertstatus();
                    },
                    child: Text(
                      'End Election',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ]))),
    );
  }
}
