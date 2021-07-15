import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final Function validator;
  final String name;
  final Function onTap;

  PasswordTextFormField(
      {this.obserText, this.validator, this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obserText,
      decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(),
        hintStyle: TextStyle(color: Colors.black),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obserText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
