import 'package:election/addvoter.dart';
import 'package:flutter/material.dart';

class VotersList extends StatelessWidget {
  // const VotersList({Key? key}) : super(key: key);

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
    );
  }
}