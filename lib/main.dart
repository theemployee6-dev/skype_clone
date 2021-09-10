import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/provider/image_upload_provider.dart';
import 'package:skype_clone/provider/user_provider.dart';
import 'package:skype_clone/resources/auth_methods.dart';
import 'package:skype_clone/screens/search_screen.dart';

import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthMethods _auth = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ImageUploadProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Skype Clone',
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/search_screen": (context) => SearchScreen(),
        },
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: FutureBuilder(
          future: _auth.getCurrentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
