import 'package:election/widget/info_card.dart';
import 'package:flutter/material.dart';
import '../widget/info_card.dart';
import 'package:http/http.dart' as http;
// import '../widget/navbar.dart';

//data for the admin dashboard

const phone='9840066162';
const email= 'aryanashish223@gmail.com';
const position= 'Project supervision';
const faculty= 'IT';
const name= 'Ashish Sapkota';

class HomePage extends StatefulWidget {
    var email;
  HomePage(@required this.email);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // const HomePage({Key? key}) : super(key: key);
     Future<void> getrecord() async{
    String uri = "http://192.168.1.67/voting/php/admindata.php/";
    final response=await http.post(Uri.parse(uri),
          body: { 
          'email': email,
          }
    );
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
      body: SafeArea( 
        minimum: const EdgeInsets.only(top:50),  
        //only giving styling in top 
        child:Column(
          children: <Widget>[
            const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/ashish.jpg'),
            ),
            const Text(name,
            // get from db
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
            const Text(
              position, //get data from db
              style: TextStyle(
                fontSize: 30,
                color: Colors.amberAccent,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,

              ),
            ),

            const SizedBox(
              height: 50,
              width: 250,
              child: Divider(
                color: Colors.white,
                thickness: 3,
                ),
            ),

            InfoCard(text: faculty, icon: Icons.book, onPressed: () {}),
            InfoCard(text: position, icon: Icons.admin_panel_settings_rounded, onPressed: () {}),
            InfoCard(text: phone, icon: Icons.phone, onPressed: () {}),
            InfoCard(text: email, icon: Icons.email, onPressed: () {}),
            
          ],
        ), 
        ),
    );
  }
}