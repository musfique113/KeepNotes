import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlekeep/services/auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login To App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(Buttons.Google, onPressed: () async{
              await signInWithGoogle();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            })
          ],
        ),
      ),
    );
  }
}
