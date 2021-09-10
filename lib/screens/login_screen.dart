import 'package:flutter/material.dart';
import 'package:skype_clone/resources/auth_methods.dart';

import 'package:skype_clone/screens/home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:shimmer/shimmer.dart';
import 'package:skype_clone/utils/universal_variables.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _auth = AuthMethods();
  bool isLoginPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      body: Stack(
        children: [
          Center(
            child: loginButton(),
          ),
          isLoginPressed
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget loginButton() {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: UniversalVariables.senderColor,
      child: FlatButton(
        onPressed: () => performLogin(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(35),
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  void performLogin() {
    print('trying to perform login');
    setState(() {
      isLoginPressed = true;
    });
    _auth.signIn().then((FirebaseUser user) {
      print('something');
      if (user != null) {
        authenticateUser(user);
      } else {
        print('error occurred... ?');
      }
    });
  }

  void authenticateUser(FirebaseUser user) {
    _auth.authenticateUser(user).then((isNewUser) {
      setState(() {
        isLoginPressed = false;
      });
      if (isNewUser) {
        _auth.addDataToDb(user).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        });
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
    });
  }
}
