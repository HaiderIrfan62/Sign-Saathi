import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sign_saathi_app/screens/AvatarPage.dart';
import 'package:sign_saathi_app/screens/LandingPage.dart';
import 'package:sign_saathi_app/screens/LessonPage.dart';
import 'package:sign_saathi_app/screens/login.dart';


List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Saathi',
      home: AvatarPage(),
    );
  }
}

