// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Ballot extends StatefulWidget {
  // Ballot({Key? key}) : super(key: key);

 @override
 State<Ballot> createState() => _BallotState();
}
class _BallotState extends State<Ballot>{
  List userdata=[];
  Future<List> getrecord() async{
    String uri = "http://192.168.1.67/voting/php/candidatelist.php/";
    //  String uri = "http://192.168.1.69/voting/php/candidatelist.php/"; 
    try{
      var response= await http.get(Uri.parse(uri));
      setState((){
      userdata = jsonDecode(response.body);
      });
    }catch(e){print(e);}
      return userdata;
  }

  @override
  void initState(){
    getrecord();
    super.initState();
  }
  Future castVote(uid,name) async {
    try{

        String url = "http://192.168.1.67/voting/php/vote.php/";
    //  String uri = "http://192.168.1.69/voting/php/candidatelist.php/";
          var response= await http.post(Uri.parse(url), body: {
                'uid': uid,
                'name':name,
              });
              var data=json.decode(json.encode(response.body));
        if(data!= "data insertion Success"){
          print(data);
    
        }else{
          print("Success");
        }
            
    }catch(e){
      print(e);
    }    
        
  }
void confirm (uid,name){
  AlertDialog alertDialog = new AlertDialog(
    // ignore: prefer_interpolation_to_compose_strings
    content: new Text("Are You sure want to vote " +name),
    actions: <Widget>[
      new RaisedButton(
        child: new Text("Yes! vote",style: new TextStyle(color: Colors.black),),
        color: Colors.green,
        onPressed: (){
            AlertDialog alertDialog = new AlertDialog(
            content: new Text("voted successfully")
            );
          castVote(uid,name);

        },
      ),
    ],
  );

  //showDialog(context: context, child: alertDialog);
  showDialog(builder: (context) => alertDialog, context: context);
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
        itemBuilder: (context,index){
          String image= userdata[index]['image'];
           var uid=userdata[index]['uid'];
           var name=userdata[index]['name'];
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
                   'http://192.168.1.67/voting/$image',
                  //  'http://192.168.1.69/voting/$image',
                   width: 60,
                   height: 55,
                   fit: BoxFit.cover,
                  ),
                ),
              ),
              trailing: RaisedButton(
                child: new Text("Vote"),
                color: Colors.green,
                onPressed: (){
                    confirm(uid,name);
                }                      
              ),
              title: Text(userdata[index]["name"]),
              subtitle: Text(userdata[index]["email"]),
            ),
          
            );
        }
      ),
    );
  }
}

