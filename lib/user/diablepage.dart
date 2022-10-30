import 'package:flutter/material.dart';

import '../user/dashboard.dart';

class DisablePage extends StatelessWidget {
  // const DisablePage({Key? key}) : super(key: key);
        var email;
 DisablePage(this.email, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidates'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 350),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Election not started",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AdminDashboard(email),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('OK',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
