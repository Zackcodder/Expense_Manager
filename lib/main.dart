import 'package:flutter/material.dart';
import 'package:faith/pages/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // ignore: prefer_const_constructors
    home: SignIn(),
  ));
}
