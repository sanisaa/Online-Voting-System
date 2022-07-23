import 'package:flutter/material.dart';

class Candidates extends StatelessWidget {
  const Candidates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidates'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
    );
  }
}