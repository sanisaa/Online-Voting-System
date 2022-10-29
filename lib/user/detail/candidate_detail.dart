// ignore_for_file: unnecessary_new
import 'package:election/user/lists/candiates.dart';
import 'package:election/api.dart';
import 'package:election/widget/info_card.dart';
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
void confirm (){
  AlertDialog alertDialog = new AlertDialog(
    content: new Text("Are You sure want to delete '${widget.list[widget.index]['name']}'"),
    actions: <Widget>[
      new ElevatedButton(
        child: new Text("OK DELETE!",style: new TextStyle(color: Colors.black),),
        style:ElevatedButton.styleFrom(
          primary: Colors.red),
        onPressed: (){
          deleteData();
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new CandidateList(),
            )
          );
        },
      ),
      new ElevatedButton(
        child: new Text("CANCEL",style: new TextStyle(color: Colors.black)),
        style:ElevatedButton.styleFrom(
          primary: Colors.green,),
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );

  //showDialog(context: context, child: alertDialog);
  showDialog(builder: (context) => alertDialog, context: context);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(title: new Text("${widget.list[widget.index]['name']}"),
        backgroundColor: Colors.purple,
        ),
                
        body: SingleChildScrollView(
       
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
                  child: Image.network(
                   '$uri/voting/${widget.list[widget.index]['image']}',
                  //  'http://192.168.1.69/voting/$image',
                   width: 200,
                   height: 200,
                   fit: BoxFit.cover,
                  ),
                ),
            ),
            ]
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                  Container(
                         child:InfoCard(text: "Name: ${widget.list[widget.index]["name"]}", icon: Icons.account_circle, onPressed: () {}),
                        ),
                         Container(
                          child:InfoCard(text: "Agenda: ${widget.list[widget.index]["agenda"]}", icon: Icons.pageview, onPressed: () {}),
                        ),
                         Container(
                          
                         child:InfoCard(text: "Email: ${widget.list[widget.index]["email"]}", icon: Icons.email, onPressed: () {}),
                        ),
                         Container(
                          child:InfoCard(text: "Phone: ${widget.list[widget.index]["phone"]}", icon: Icons.phone, onPressed: () {}),
                        ),
                         Container(
                         child:InfoCard(text: "Gender: ${widget.list[widget.index]["gender"]}", icon: Icons.boy, onPressed: () {}),
                        ),
                        Container(
                          child:InfoCard(text: "Faculty: ${widget.list[widget.index]["faculty"]}", icon: Icons.home, onPressed: () {}),
                        ),
                    new Padding(padding: const EdgeInsets.only(top: 30.0),),
                   
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
              ],
              
            ),
          ],
        ),
          ],
        
        )
      ));
                      
  }
}
