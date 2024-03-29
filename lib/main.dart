import 'package:flutter/material.dart';
import 'Screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

/// Main application widget.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

/// State class for the main application widget.
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
