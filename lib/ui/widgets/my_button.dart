import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Function onPressed;
  final String name;

  MyButton({this.onPressed, this.name});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue,
        ),
        onPressed: onPressed,
        child: Text(name,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
