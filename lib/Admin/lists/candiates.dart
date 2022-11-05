import 'dart:convert';

import 'package:election/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../addform/addcandidate.dart';
import '../detail/candidate_detail.dart';

class CandidateList extends StatefulWidget {
  CandidateList({Key? key}) : super(key: key);

  @override
  State<CandidateList> createState() => _CandidateListState(userdata: []);
}

class _CandidateListState extends State<CandidateList> {
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

  //late final List list;
  _CandidateListState({required this.userdata});

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
        title: Text('Candidates'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
            (){
              setState(() {
                userdata.addAll;
              });
              showSuccessSnackBar(Text("page refrfeshed"));
            } 
            
          );
          },
          
        child: ListView.builder(
            // itemCount: userdata.length,
            itemCount: userdata == null ? 0 : userdata.length,
            itemBuilder: (context, index) {
              String image = userdata[index]['image'];
              // print(image);
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
                  title: Text(userdata[index]["name"]),
                  subtitle: Text(userdata[index]["agenda"]),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new DetailView(list: userdata, index: index))),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => addNewCandidate(),
            ),
          );
        },
      ),
    );
  }
}
