
import 'package:election/Admin/home.dart';
import 'package:flutter/material.dart';
import '../Admin/home.dart';

class NavBar extends StatelessWidget {
  // const NavBar({Key? key}) : super(key: key);
    // VoidCallback Onpressed;

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
            child: Image.asset('assests/images/ashish.JPG',
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
              image: AssetImage('assests/images/background.JPG'),
              ),
          ),
         ),
        ListTile(
          leading:const Icon(Icons.account_box),
          title: const Text('profile'),
          onTap: ()=> {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: const Icon(Icons.person_add_alt_1_rounded),
          title: const Text('Candidates'),
          onTap: ()=> {Navigator.of(context).pop()},
        ),
                ListTile(
          leading:const Icon(Icons.person_add),
          title: const Text('Voters'),
          onTap: ()=> {Navigator.of(context).pop()},
        ),
        ListTile(
          leading:const Icon(Icons.pages),
          title: const Text('Votes'),
          onTap: ()=> {Navigator.of(context).pop()},
        ),
        ListTile(
          leading:const Icon(Icons.description),
          title: const Text('Complaints'),
          onTap: ()=> {Navigator.of(context).pop()},
        ),
        ListTile(
          leading:const Icon(Icons.exit_to_app),
          title: const Text('Exit'),
          onTap: ()=> {Navigator.of(context).pop()},
        ),
      ],
    ),
   );
  }
}