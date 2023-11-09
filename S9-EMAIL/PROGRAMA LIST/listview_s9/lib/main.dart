import 'package:flutter/material.dart';
import 'package:listview_s9/screens/ListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-mail ULEAM',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const ListScreen(),
    );
  }
}
