import 'package:designcode/screens/home_screen.dart';
import 'package:designcode/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: (FirebaseAuth.instance.currentUser == null)
                ? LoginScreen()
                : HomeScreen(),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Container(),
            ),
          );
        }
      },
    );
  }
}
