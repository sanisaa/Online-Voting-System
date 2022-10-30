import 'dart:convert';
import 'package:election/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../widget/adminnavbar.dart';

class StartEnd extends StatefulWidget {
  // const StartEnd({Key? key}) : super(key: key);
  var email;
 StartEnd(this.email, {Key? key}) : super(key: key);


  @override
  State<StartEnd> createState() => _StartEndState();
}

class _StartEndState extends State<StartEnd> {
  late int status;

  Future<void> insertstatus() async {
    var url = "$uri/voting/php/updateStatus.php/";
    final response =
        await http.post(Uri.parse(url), body: {'status': status.toString()});
    var data = json.decode(json.encode(response.body));
    if (data != "data insertion Success") {
      print(data);
    } else {
      print("Success");
    }
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
                    },
                    child: Text('StartElection',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
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
                    child: Text('End Election',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
              ]))),
    );
  }
}
