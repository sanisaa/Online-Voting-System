import 'package:election/api.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Votes extends StatefulWidget {
  @override
  State<Votes> createState() => _VotesState();
}

class _VotesState extends State<Votes> {
  // const Votes({Key? key}) : super(key: key);
    List userdata=[];

  Future<List> getrecord() async{
    String url = "$uri/voting/php/result.php/";
    //  String uri = "http://192.168.1.69/voting/php/candidatelist.php/"; 
    try{
      var response= await http.get(Uri.parse(url));
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
        title: Text('Vote Count'),
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
                   '$uri/voting/$image',
                  //  'http://192.168.1.69/voting/$image',
                   width: 60,
                   height: 55,
                   fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(userdata[index]["name"]),
              subtitle: Text(userdata[index]["agenda"]),
              trailing: Text(userdata[index]['vote_count'], style: TextStyle(fontWeight: FontWeight.bold),),
            ), 
            );
        }
      ),
    );
  }
}