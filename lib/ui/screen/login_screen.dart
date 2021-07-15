import 'package:ecommerce_provider/ui/screen/signup_screen.dart';
import 'package:ecommerce_provider/ui/widgets/change_screen.dart';
import 'package:ecommerce_provider/ui/widgets/my_button.dart';
import 'package:ecommerce_provider/ui/widgets/mytext_form_field.dart';
import 'package:ecommerce_provider/ui/widgets/password_text_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

bool obserText = true;

class _LoginScreenState extends State<LoginScreen> {
  void vaildation() {
    final FormState _form = _formkey.currentState;
    if (_form.validate()) {
      print('yes');
    } else {
      print('No');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildAllPart() {
      return Container(
        height: 300,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'login',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            MyTextFormField(
              name: 'Email',
              validator: (value) {
                if (value == '') {
                  return 'Please fill email';
                } else if (!regExp.hasMatch(value)) {
                  return 'Email is Invalid';
                }
                return '';
              },
            ),
            PasswordTextFormField(
              obserText: obserText,
              name: 'Password',
              onTap: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  obserText = !obserText;
                });
                FocusScope.of(context).unfocus();
              },
              validator: (value) {
                if (value == '') {
                  return 'Please fill password';
                } else if (value.length < 8) {
                  return 'Password is too short';
                }
                return '';
              },
            ),
            MyButton(
              onPressed: () {
                vaildation();
              },
              name: 'Register',
            ),
            ChangeScreen(
              name: 'SignUp',
              whichAccount: "You don't have an account?",
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => SignUpScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAllPart(),
            ],
          ),
        ),
      ),
    );
  }
}
