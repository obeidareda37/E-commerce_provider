import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  String whichAccount;
  String name;
  Function onTap;

  ChangeScreen({this.name, this.onTap, this.whichAccount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(whichAccount),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
