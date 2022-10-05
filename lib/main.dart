import 'package:flutter/material.dart';
import 'package:testes/screens/initialScreen.dart';
import 'package:testes/data/task_inherited.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Lista De Estudos',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        backgroundColor: Colors.indigo
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}







