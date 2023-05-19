import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  String name;
  final IconData iconData;

  Buttons({required this.name, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(5),boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // adjust the color
              spreadRadius: 0, // adjust the spread radius
              blurRadius: 6, // adjust the blur radius
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, color: Colors.white, size: 30), // increase icon size
              SizedBox(width: 10), // space between the icon and text
              Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 18), // decrease font size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
