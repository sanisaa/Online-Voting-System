import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Change'),
        backgroundColor: Colors.purple,
      ),

      body: 
        Card(
          elevation: 5,
          child: Column(children: <Widget>[
            Container(
              height: 200,
              child: const Image(
                image:AssetImage('assests/images/logo.png',),
                // fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const TextField(
              textAlign: TextAlign.center,
              decoration: 
                InputDecoration(hintText: 'Phone Number'),
                keyboardType: TextInputType.number,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: FlatButton(
              child: Text('Next'),
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: (){},
            ),
          ),
          ],
          ),
        ),
    );
  }
}