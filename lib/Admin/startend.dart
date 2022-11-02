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
  var button;
    late String but;
  Future<void> insertstatus() async {
    var url = "$uri/voting/php/updateStatus.php/";
    final response =
        await http.post(Uri.parse(url), body: {'status': status.toString()});
    var data = json.decode(json.encode(response.body));
    if (data != "data insertion Success") {
      showSuccessSnackBar(Text("Success"));
      print(data);
    } else {
      print("Success");
      showSuccessSnackBar(Text(""));
    }
  }
 Future<String> verify() async{
    String url = "$uri/voting/php/enddisable.php/";
      final response= await http.post(Uri.parse(url));
       button = json.encode(json.decode(response.body));
      
      print(button);
       but=button.toString();
      return but;

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
  void initState() {
    verify();
    super.initState();
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
                      print(status);
                      // enableBallot();
                      insertstatus();
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
                      if(but.compareTo("0")==0){
                          insertstatus();
                      }else{
                        print("cannot end right now");
                        showSuccessSnackBar(const Text("Still everyone has not voted! Cannot end right now"));
                      }
                      
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
