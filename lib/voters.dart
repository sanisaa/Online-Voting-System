// ignore_for_file: unnecessary_new

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
  Future<List> getrecord() async{
    String uri = "http://192.168.1.69/voting/php/voterlist.php/"; 
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Voters'),
        centerTitle: true,
        backgroundColor: Colors.purple,
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
        // ignore: unnecessary_new
      body: new FutureBuilder<List>(
        future: getrecord(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              // ignore: unnecessary_new
              ? new ItemList(
                  list: snapshot.data!,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
class ItemList extends StatelessWidget {
  final List list;
  
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new DetailView(list:list , index: i,)
              )
            ),
            child: new Card(

              child: new ListTile(
                title: new Text(list[i]['name']),
                leading: CircleAvatar(
                  minRadius: 10,
                  maxRadius: 50,
                  // radius: 20,
                  child: ClipOval(
                    child: Image.network(
                       'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                    //'http://192.168.1.69/voting/$image',
                     width: 60,
                     height: 55,
                     fit: BoxFit.cover,
                     
                    ),
                  ),
                ),
                subtitle: new Text("Email : ${list[i]['email']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

