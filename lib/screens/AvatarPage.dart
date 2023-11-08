import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF6F4EB),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(screenSize.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue, // Blue background circle
                    child: Icon(Icons.menu, size: screenSize.height * 0.035, color: Colors.white), // White icon
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue, // Blue background circle
                    radius: screenSize.height * 0.04,
                    child: CircleAvatar(
                      radius: screenSize.height * 0.035,
                      backgroundImage: AssetImage('lib/assets/avatar.png'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/character.png',
                    height: screenSize.height * 0.5,
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Type something',
                        contentPadding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue, // Blue background for the bottom icons
              padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person, size: screenSize.height * 0.035, color: Colors.white),
                  Icon(Icons.camera_alt, size: screenSize.height * 0.035, color: Colors.white),
                  Icon(Icons.thumb_up, size: screenSize.height * 0.035, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
