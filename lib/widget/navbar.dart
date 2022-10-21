
import 'package:election/Admin/dashboard.dart';
import 'package:election/Admin/home.dart';
import 'package:election/ballot.dart';
import 'package:election/voters.dart';
import 'package:election/votes.dart';
import 'package:flutter/material.dart';
import '../candiates.dart';

class NavBar extends StatelessWidget {
  // const NavBar({Key? key}) : super(key: key);

void selectedItem(BuildContext context, int index){
  Navigator.of(context).pop(); 
  //doesnot show side bar when pressed back button from pages

  switch(index){
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=> AdminDashboard(),
        ),);
        break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=> CandidateList(),
        ),);
        break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=> VotersList(),
        ),);
        break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=> Ballot(),
        ),);
        break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=> AdminDashboard(),
        ),);
        break;
  }
}

  @override
  Widget build(BuildContext context) {
   return Drawer(
    child: ListView(
      //remove padding
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName:  const Text('Ashish Sapkota'),
         accountEmail:  const Text('aryanashish223@gmail.com'),
         currentAccountPicture: CircleAvatar(
          child: ClipOval(
            child: Image.asset('assets/images/ashish.jpg',
            fit: BoxFit.cover,
            width: 90,
            height: 90,
            ),
          ), 
          ),
          decoration: const BoxDecoration(
            color:Colors.blue,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/background.JPG'),
              ),
          ),
         ),
        ListTile(
          leading:const Icon(Icons.account_box),
          title: const Text('profile'),
          onTap: ()=> selectedItem(context ,0),
        ),
        ListTile(
          leading: const Icon(Icons.person_add_alt_1_rounded),
          title: const Text('Candidates'),
          onTap: ()=> selectedItem(context ,1),
        ),
                ListTile(
          leading:const Icon(Icons.person_add),
          title: const Text('Voters'),
          onTap: ()=> selectedItem(context ,2),
        ),
        ListTile(
          leading:const Icon(Icons.pages),
          title: const Text('Votes'),
          onTap: ()=> selectedItem(context ,3),
        ),
        ListTile(
          leading:const Icon(Icons.description),
          title: const Text('Ballot'),
          onTap: ()=> selectedItem(context ,3),
        ),
        ListTile(
          leading:const Icon(Icons.exit_to_app),
          title: const Text('Exit'),
          onTap: ()=> selectedItem(context ,4),
        ),
      ],
    ),
   );
  }
}