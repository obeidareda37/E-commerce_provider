import 'package:ecommerce_provider/ui/screen/login_screen.dart';
import 'package:ecommerce_provider/ui/widgets/change_screen.dart';
import 'package:ecommerce_provider/ui/widgets/my_button.dart';
import 'package:ecommerce_provider/ui/widgets/mytext_form_field.dart';
import 'package:ecommerce_provider/ui/widgets/password_text_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

bool obserText = true;

class _SignUpState extends State<SignUpScreen> {
  void vaildation() {
    final FormState _form = _formKey.currentState;
    if (_form.validate()) {
      print('yes');
    } else {
      print('No');
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 330,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            name: 'UserName',
            validator: (value) {
              if (value == '') {
                return 'Please fill username';
              } else if (value.length < 6) {
                return 'Username is too short';
              }
              return '';
            },
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
          MyTextFormField(
            name: 'Phone Number',
            validator: (value) {
              if (value == '') {
                return 'Please fill phone number';
              } else if (value.length < 11) {
                return 'Phone number must be 11';
              }
              return '';
            },
          ),
        ],
      ),
    );
  }

  Widget buildBottomPart() {
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAllTextFormField(),
          MyButton(
            onPressed: () {
              vaildation();
            },
            name: 'Login',
          ),
          ChangeScreen(
            name: 'Login',
            whichAccount: "You have an account?",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
