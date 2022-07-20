import 'package:election/widget/info_card.dart';
import 'package:flutter/material.dart';
import '../widget/info_card.dart';

//data for the admin dashboard

const phone='9840066162';
const email= 'aryanashish223@gmail.com';
const position= 'Project supervision';
const faculty= 'IT';
const name= 'Ashish Sapkota';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea( 
        minimum: const EdgeInsets.only(top:50),  
        //only giving styling in top 
        child:Column(
          children: <Widget>[
            const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assests/images/person.png'),
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