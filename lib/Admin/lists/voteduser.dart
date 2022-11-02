import 'dart:convert';
import 'package:election/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../detail/candidate_detail.dart';


class VotedUser extends StatefulWidget {
  VotedUser({Key? key}) : super(key: key);

 @override
 State<VotedUser> createState() => _VotedUserState();
}
class _VotedUserState extends State<VotedUser>{
  List userdata=[];
  Future<List> getrecord() async{
    String url = "$uri/voting/php/votedusers.php/";
    //  String uri = "http://192.168.1.66/voting/php/candidatelist.php/"; 
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
  //late final List list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
       // itemCount: userdata.length,
        itemCount: userdata == null ? 0 : userdata.length,
        itemBuilder: (context,index){
          String image= userdata[index]['image'];
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
              title: Text(userdata[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(userdata[index]["faculty"],style: TextStyle(fontWeight: FontWeight.w200),),
          onTap: (){}
            ), 
            );
        }
      ),
    );
  }
}
