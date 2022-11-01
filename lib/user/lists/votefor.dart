import 'package:election/user/lists/ballot.dart';
import 'package:election/widget/navbar.dart';
import 'package:flutter/material.dart';


class VoteFor extends StatefulWidget {
    
    var email;
  VoteFor(@required this.email);
    @override
  State<VoteFor> createState() => _VoteForState();
}

class _VoteForState extends State<VoteFor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cast your vote for..'),
        backgroundColor: Colors.purple,
      ),
      drawer: NavBar(widget.email),
      body: ListView.builder(
       itemCount: 1,
        itemBuilder: (context,index){
          // print(image);
          return Container(
            padding: EdgeInsets.only(top:70),
            height: 200,
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(Icons.add),
                title: Text("President",textScaleFactor: 1.5,),
                 trailing: Icon(Icons.arrow_forward),
                subtitle: Text('Choose your President'),
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Ballot(widget.email)
                  )),
              ), 
              ),
          );
        }
      ),
    );
  }
}
