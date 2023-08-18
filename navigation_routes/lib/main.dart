import 'package:flutter/material.dart';
import 'Login.dart';
import 'Signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {'/sinup': (_) => Signup()},
    );
  }
}
