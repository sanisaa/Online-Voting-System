import 'package:election/api.dart';
import 'package:election/widget/info_card.dart';
import 'package:flutter/material.dart';
import '../widget/info_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
    var email;
  HomePage(@required this.email);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // const HomePage({Key? key}) : super(key: key);
  var userdata;
 Future<void>  getrecord() async{
    String url = "$uri/voting/php/admindata.php/";
    //  String uri = "http://192.168.1.69/voting/php/candidatelist.php/"; 
    try{
      var response= await http.post(Uri.parse(url),body: {
        'email':widget.email,
      });
      setState((){
      userdata = json.decode(response.body);
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
      backgroundColor: const Color.fromARGB(255, 10, 65, 138),
      body:  ListView.builder(
        itemCount: userdata == null ? 0 : userdata.length,
        itemBuilder: (context,index){
          String image= userdata[index]['image'];
        return SingleChildScrollView(    
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
                   '$uri/voting/$image',
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
                          child:InfoCard(text: userdata[index]["name"], icon: Icons.account_circle, onPressed: () {}),
                        ),
                         Container(
                          child:InfoCard(text: userdata[index]["email"], icon: Icons.mail, onPressed: () {}),
                        ),
                         Container(
                          
                          child:InfoCard(text: userdata[index]["phone"], icon: Icons.phone, onPressed: () {}),
                        ),
                         Container(
                          child:InfoCard(text: userdata[index]["gender"], icon: Icons.boy, onPressed: () {}),
                        ),
                         Container(
                          child:InfoCard(text: userdata[index]["uid"], icon: Icons.add_outlined, onPressed: () {}),
                        ),
              ],
            ),
          ],
        ),
          ],
        
        )
      );
        }
      ),
    );
  }
}
