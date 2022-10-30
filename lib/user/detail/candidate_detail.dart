// ignore_for_file: unnecessary_new
import 'package:election/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DetailView extends StatefulWidget {
  List list;
  int index;
  DetailView({required this.index,required this.list});
  @override
  _DetailViewState createState() =>  _DetailViewState();

} 

class _DetailViewState extends State<DetailView> {

 void deleteData(){
  var url="$uri/voting/php/delete.php";
  // var url="$uri/voting/php/delete.php";
  http.post(Uri.parse(url), body: {
    'uid': widget.list[widget.index]['uid']
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(title: new Text("${widget.list[widget.index]['name']}"),
        backgroundColor: Colors.purple,
        ),
                
        body: Container(
            child: Column( 
              children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.indigo, width: 5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: ClipOval(
                            child :Image.network(
                             
                             '$uri/voting/${widget.list[widget.index]['image']}',
                            //  'http://192.168.1.69/voting/${widget.list[widget.index]['image']}',
                               //  'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                                  width: 170,
                                  height: 170,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Container(
          height: 270.0, 
          padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['name'], style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,)),
                new Text("Agenda : ${widget.list[widget.index]['agenda']}", style: new TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold,),),
                new Text("Email : ${widget.list[widget.index]['email']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Phone : ${widget.list[widget.index]['phone']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Gender : ${widget.list[widget.index]['gender']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Faculty : ${widget.list[widget.index]['faculty']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
              ],
            ),
          ),
        ),
      ),
    ])));
                      
  }
}