import 'package:election/addvoter.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class VotersList extends StatefulWidget {
  VotersList({Key? key}) : super(key: key);

 @override
 State<VotersList> createState() => _VotersListState();
}
class _VotersListState extends State<VotersList>{
  List userdata=[];
  Future<void> getrecord() async{
    String uri = "http://192.168.1.69/voting/php/list.php/"; 
    try{
      var response= await http.get(Uri.parse(uri));
      setState((){
      userdata = jsonDecode(response.body);
      });
    }catch(e){print(e);}
  }

  @override
  void initState(){
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Voters'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context,index){
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
            
              title: Text(userdata[index]["name"]),
              subtitle: Text(userdata[index]["email"]),
          
            ),
            );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context,
           MaterialPageRoute(
            builder: (context)=> addNewVoter(),
            ),
          );
        },
        ),


    );
  }
}
