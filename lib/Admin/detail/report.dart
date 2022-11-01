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
      body: Container(
        height: double.infinity,
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 30,
                padding: EdgeInsets.all(1),
                child: ListTile(
                  title: Text('US Daily Retail Delieveries by Brand', style: TextStyle(fontSize: 13),),
                  trailing: Icon(Icons.favorite, size: 20,),
                ),
              ),
              Divider(color: Colors.black,),
              Container(
                height: 30,
                child: new ListTile(
                  title: Text("Price")
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
