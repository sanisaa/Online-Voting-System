import 'dart:convert';
import 'package:election/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../widget/adminnavbar.dart';
import 'package:intl/intl.dart';

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
  var button;
  late String but;
  Future<void> insertstatus() async {
    var url = "$uri/voting/php/updateStatus.php/";
    final response =
        await http.post(Uri.parse(url), body: {'status': status.toString()});
    var data = json.decode(json.encode(response.body));
    if (data != "data insertion Success") {
      notify();
      showSuccessSnackBar(Text("Election Started Successfully"));
      print(data);
    } else {
      print("Success");
      showSuccessSnackBar(Text(""));
    }
  }

  Future<void> endstatus() async {
    var url = "$uri/voting/php/endelection.php/";
    final response =
        await http.post(Uri.parse(url), body: {'status': status.toString()});
    var data = json.decode(json.encode(response.body));
    if (data != "data insertion Success") {
      end_notify();
      showSuccessSnackBar(Text("Election Ended Successfully"));
      print(data);
    } else {
      print("Success");
      showSuccessSnackBar(Text(""));
    }
  }
//Future<String> verify() async{
//     String url = "$uri/voting/php/enddisable.php/";
//       final response= await http.post(Uri.parse(url));
//        button = json.encode(json.decode(response.body));
//       print(button);
//        but=button.toString();
//       return but;

//   }
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

  Future<void> end_notify() async {
    var url = "$uri/smtpmail/endnotification.php/";
    final response = await http.post(Uri.parse(url), body: {});

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
  //  @override
  // void initState() {
  //   verify();
  //   super.initState();
  // }

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
                      icon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                        label: Text('Start Date and Time'),
                        ),
                        readOnly: true,
                        onTap: () async{
                          DateTime? pickedDate= await showDatePicker(
                            context: context,
                             initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                               lastDate: DateTime(2100)
                               );
                        
                        if(pickedDate!=null){
                          print(pickedDate);
                          String formattedDate= DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          setState(() {
                            start.text=formattedDate;
                          });
                        }else{
                          print('Date is not selected');
                        }
                        },
                        
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: end,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                        label: Text('End Time and Date')
                        ),
                         readOnly: true,
                        onTap: () async{
                          DateTime? pickedDate= await showDatePicker(
                            context: context,
                             initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                               lastDate: DateTime(2100)
                               );
                        
                        if(pickedDate!=null){
                          print(pickedDate);
                          String formattedDate= DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          setState(() {
                            end.text=formattedDate;
                          });
                        }else{
                          setState(() {
                            end.text="please select date";
                          });
                        }
                        },
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
                      // if(but.compareTo("0")==0){
                      endstatus();
                      // }else{
                      //   print("cannot end right now");
                      //   showSuccessSnackBar(const Text("Still everyone has not voted! Cannot end right now"));
                      // }
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
