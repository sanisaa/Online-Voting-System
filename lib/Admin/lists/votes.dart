import 'package:flutter/material.dart';

class Votes extends StatelessWidget {
  const Votes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votes'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
    );
  }
}