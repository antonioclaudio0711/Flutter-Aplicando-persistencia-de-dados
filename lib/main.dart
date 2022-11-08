import 'package:flutter/material.dart';
import 'package:principios/data/work_inherited.dart';
import 'package:principios/screens/principal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WorkInherited(
        child: const PrincipalScreen(),
      ),
    );
  }
}
