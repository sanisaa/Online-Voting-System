import 'package:election/addvoter.dart';
import 'package:election/user_detail.dart';
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
    String uri = "http://192.168.1.69/voting/php/voterlist.php/"; 
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
          String image= userdata[index]['image'];
          // print(image);
          return Card(
              elevation: 10,
             margin: EdgeInsets.all(10),
            child: InkWell(
              
                child: ListTile(
                leading: CircleAvatar(
                  minRadius: 10,
                  maxRadius: 50,
                  // radius: 20,
                  child: ClipOval(
                    child: Image.network(
                     'http://192.168.1.69/voting/$image',
                     width: 60,
                     height: 55,
                     fit: BoxFit.cover,
                    ),
                  ),
                  
                ),
                title: Text(userdata[index]["name"]),
                subtitle: Text(userdata[index]["email"]),
                      
              ),
              onTap:(){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> DetailView()));
              },
            )
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
