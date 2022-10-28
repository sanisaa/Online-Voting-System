import 'package:election/widget/info_card.dart';
import 'package:flutter/material.dart';
import '../widget/info_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widget/navbar.dart';

//data for the admin dashboard

// const phone='9840066162';
// const email= '...../';
// const position= 'Project supervision';
// const faculty= 'IT';
// const name= 'Ashish Sapkota';

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
    String uri = "http://192.168.1.67/voting/php/admindata.php/";
    //  String uri = "http://192.168.1.69/voting/php/candidatelist.php/"; 
    try{
      var response= await http.post(Uri.parse(uri),body: {
        'email':widget.email,
      });
      setState((){
        print(response.body);
      userdata = json.decode(response.body);
      });
    }catch(e){print(e);}

    // String url = "http://192.168.1.67/voting/php/admindata.php/";
    // //  String uri = "http://192.168.1.69/voting/php/candidatelist.php/"; 
    // try{
    //   var res= await http.get(Uri.parse(url));
    //   setState((){
    //   userdata = jsonDecode(res.body);
    //   });
    //   }catch(e){
    //     print(e);
    //   }
      // return userdata;
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
          print(userdata[index]['name']);
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
                   'http://192.168.1.67/voting/$image',
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
                        Container(
                          child:InfoCard(text: "Admin", icon: Icons.admin_panel_settings_outlined, onPressed: () {}),
                        )
              ],
            ),
          ],
        ),
          ],
        
        )
      );
        }
      ),
      // SafeArea( 
        // minimum: const EdgeInsets.only(top:50),  
        // //only giving styling in top 
        // child:Column(
        //   children: <Widget>[
        //     const CircleAvatar(
        //         radius: 50,
        //         backgroundImage: AssetImage('assets/images/ashish.jpg'),
        //     ),
        //     // const Text(name,
        //     // // get from db
        //     // style: TextStyle(
        //     //   fontSize: 40.0,
        //     //   color: Colors.white,
        //     //   fontWeight: FontWeight.bold,
        //     // ),
        //     // ),
        //     // const Text(
        //     //   position, //get data from db
        //     //   style: TextStyle(
        //     //     fontSize: 30,
        //     //     color: Colors.amberAccent,
        //     //     letterSpacing: 2.5,
        //     //     fontWeight: FontWeight.bold,

        //     //   ),
        //     // ),

        //     const SizedBox(
        //       height: 50,
        //       width: 250,
        //       child: Divider(
        //         color: Colors.white,
        //         thickness: 3,
        //         ),
        //     ),

        //     // InfoCard(text: faculty, icon: Icons.book, onPressed: () {}),
        //     // InfoCard(text: position, icon: Icons.admin_panel_settings_rounded, onPressed: () {}),
        //     InfoCard(text: userdata, icon: Icons.phone, onPressed: () {}),
        //     InfoCard(text: widget.email, icon: Icons.email, onPressed: () {}),
            
        //   ],
        // ), 
        // ),
    );
  }
}
