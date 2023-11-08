import 'package:flutter/material.dart';
import 'package:sign_saathi_app/screens/AvatarPage.dart';
import 'package:sign_saathi_app/screens/GestureRecognitionPage.dart';
import 'package:sign_saathi_app/screens/LessonPage.dart';

class NavBar extends StatelessWidget {
  final Size screenSize;
  final String pageName;

  NavBar({
    Key? key,
    required this.screenSize,
    required this.pageName,
  }) : super(key: key);

  String avatar = 'lib/assets/avatar_icon.png';
  String lessons = 'lib/assets/lessons_icon.png';
  String gestureRecognition = 'lib/assets/gestureRecognition_icon.png';

  @override
  Widget build(BuildContext context) {
    if(pageName == 'avatar'){
      avatar = 'lib/assets/avatar_selected_icon.png';
    }
    else if(pageName == 'lessons'){
      lessons = 'lib/assets/lessons_selected_icon.png';
    }
    else if(pageName == 'gestureRecognition'){
      gestureRecognition = 'lib/assets/gestureRecognition_selected_icon.png';
    }

    return Container(
      width: screenSize.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.015,),
      decoration: BoxDecoration(
        color: Color(0xFF053B50), // The color property must be moved inside the BoxDecoration
        borderRadius: BorderRadius.circular(30.0), // This will make the corners rounder
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              print('Avatar Page icon tapped!');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AvatarPage(),
                ),
              );
            },
            child: Image.asset(avatar),
          ),
          GestureDetector(
            onTap: () {
              print('Lessons Page icon tapped!');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonPage(),
                ),
              );
            },
            child: Image.asset(lessons),
          ),
          GestureDetector(
            onTap: () {
              print('Gesture Recognition Page icon tapped!');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => GestureRecognitionPage(),
                ),
              );
            },
            child: Image.asset(gestureRecognition),
          ),
        ],
      ),
    );
  }
}
