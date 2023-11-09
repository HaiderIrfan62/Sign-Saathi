import 'package:flutter/material.dart';
import 'package:sign_saathi_app/config/strings.dart';
import 'package:sign_saathi_app/utils/Button.dart';

import '../config/config.dart';
import '../utils/NavBar.dart';
import '../utils/sidebarNprofile.dart';

class GestureRecognitionPage extends StatefulWidget {
  const GestureRecognitionPage({Key? key}) : super(key: key);

  @override
  State<GestureRecognitionPage> createState() => _GestureRecognitionPageState();
}

class _GestureRecognitionPageState extends State<GestureRecognitionPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SideBarNProfile(screenSize: screenSize, imagePath: 'lib/assets/avatar.png'),
            Container(
              padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.015, horizontal: screenSize.width * 0.015),
              height: screenSize.height * 0.7,
              width: screenSize.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0xFF263238), // The color property must be moved inside the BoxDecoration
                borderRadius: BorderRadius.circular(30.0), // This will make the corners rounder
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text(GestureRecognitionWordHeading, style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),),
                  ),
                  Text('ABLE', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Button(color: Color(0xFF357C93), text: GestureRecognitionStartBtn),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.010),
            NavBar(screenSize: screenSize, pageName: PageNameGestureRecognition),
            SizedBox(height: screenSize.height * 0.01),
          ],
        ),
      ),
    );
  }
}
