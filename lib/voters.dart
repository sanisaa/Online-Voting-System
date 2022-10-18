// ignore_for_file: unnecessary_new

import 'package:election/addvoter.dart';
import 'package:election/user_detail.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class VotersList extends StatefulWidget {
   VotersList({Key? key}) : super(key: key);

 @override
 State<VotersList> createState() => _VotersListState(userdata: []);
}
class _VotersListState extends State<VotersList>{
  List userdata=[];
  Future<List> getrecord() async{
    String uri = "http://192.168.1.67/voting/php/voterlist.php/"; 
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
 _VotersListState({required this.userdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Voters'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
       body: ListView.builder(
       // itemCount: userdata.length,
        itemCount: userdata == null ? 0 : userdata.length,
        itemBuilder: (context,index){
          String image= userdata[index]['image'];
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
                   'http://192.168.1.67/voting/$image',
                   width: 60,
                   height: 55,
                   fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(userdata[index]["name"]),
              subtitle: Text(userdata[index]["email"]),
          onTap: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new DetailView(
                list:userdata, index: index)
                )),
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
