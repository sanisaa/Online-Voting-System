import 'package:flutter/material.dart';

class ALoginn extends StatefulWidget {
  final String message;
  ALoginn({
    required this.message,
  });
  //const ALogin({Key? key})
  //: super(key: key);

  @override
  State<ALoginn> createState() => _LoginState();
}

class _LoginState extends State<ALoginn> {
  showSnackBar(message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(widget.message)));
  }

  @override
  Widget build(BuildContext context) {
    return showSnackBar(widget.message);
  }
}
