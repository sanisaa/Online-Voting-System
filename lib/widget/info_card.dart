
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // const InfoCard({Key? key}) : super(key: key);

  final String text;
  final IconData icon;
  VoidCallback onPressed;

InfoCard({
  required this.text, 
  required this.icon,
  required this.onPressed
});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin:const EdgeInsets.symmetric(vertical:10, horizontal: 25), // styling of box
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
            ),
            title: Text(
              text,
              style: const TextStyle(
                color: Colors.teal,
              fontSize: 20,
              ),
            ),
        ),
      ),

    );
  }
}