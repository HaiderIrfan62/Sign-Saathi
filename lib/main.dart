import 'package:flutter/material.dart';
import 'package:sign_saathi_app/screens/LandingPage.dart';
import 'package:sign_saathi_app/screens/LessonPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Saathi',
      home: const LessonPage(),
    );
  }
}

