import 'package:flutter/material.dart';

class SideBarNProfile extends StatelessWidget {
  final Size screenSize;
  final String imagePath;

  const SideBarNProfile({
    Key? key,
    required this.screenSize,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF053B50),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(screenSize.height * 0.015), // Adjust the padding to fit your design
            child: GestureDetector(
              onTap: () {
                print('Side Bar icon tapped!');
              },
              child: Image.asset('lib/assets/sidebar_icon.png'),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF053B50),
              shape: BoxShape.circle,
            ),
            height: screenSize.height * 0.08, // This is the total diameter of the outer circle
            width: screenSize.height * 0.08, // Ensure width and height are equal to form a perfect circle
            child: Padding(
              padding: EdgeInsets.all(screenSize.height * 0.005), // This padding will act as the border
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Inner circle color, typically the background
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
