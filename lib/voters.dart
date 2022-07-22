import 'package:flutter/material.dart';

class VotersList extends StatelessWidget {
  const VotersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voters'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
    );
  }
}