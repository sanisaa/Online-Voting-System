import 'package:election/admin/lists/ballot.dart';
import 'package:election/widget/adminnavbar.dart';
import 'package:flutter/material.dart';


class Report extends StatefulWidget {
    
    var email;
  Report(@required this.email);
    @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Card'),
        backgroundColor: Colors.purple,
      ),
      drawer: NavBar(widget.email),
      body: GridView.count(  
                crossAxisCount: 3,  
                crossAxisSpacing: 4.0,  
                mainAxisSpacing: 8.0, 
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 30,
                    width: 20,
                    color: Color.fromARGB(255, 227, 181, 235),
                    child: const ListTile(
                  title: Text('Voted Users', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                  trailing: Icon(Icons.arrow_forward, size: 20,color: Colors.green,),
                  
                ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 30,
                    width: 20,
                    color: Colors.purple,
                  ),
                                    Container(
                    margin: EdgeInsets.all(10),
                    height: 30,
                    width: 20,
                    color: Colors.purple,
                  ),
                                    Container(
                    margin: EdgeInsets.all(10),
                    height: 30,
                    width: 20,
                    color: Colors.purple,
                  ),
                ],
      )
      );
  }
}