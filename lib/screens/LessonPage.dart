import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
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
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.menu, size: screenSize.height * 0.035, color: Colors.white),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: screenSize.height * 0.04,
                    child: CircleAvatar(
                      radius: screenSize.height * 0.035,
                      backgroundImage: AssetImage('lib/assets/avatar.png'),
                    ),
                  ),
                ],
              ),
            ),
            
            // Rectangle with search bar just below the top two icons
Container(
  margin: EdgeInsets.fromLTRB(screenSize.width * 0.05, 0, screenSize.width * 0.05, 0),
  height: screenSize.height * 0.30,
  width: screenSize.width * 0.9, // 1/4th of the screen
  decoration: BoxDecoration(
    color: Color(0xff357C93),
    borderRadius: BorderRadius.circular(30.0),
  ),
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Row(
        children: [
          // Left Half
          Expanded(
            flex: 1, // Set flex to 1 to take up equal space
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: screenSize.width * 0.05), // Adjust the left padding as needed
                child: Text(
                  "LET'S LEARN TOGETHER",
                  style: TextStyle(
                    fontFamily: 'LemonMilk', // Use the defined font family
                    fontSize: 30, // Change the font size as needed
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Make the text bold
                  ),
                ),
              ),
            ),
          ),
          // Right Half
          Expanded(
            flex: 1, // Set flex to 1 to take up equal space
            child: Center(
              child: Image.asset('lib/assets/Student.png'),
            ),
          ),
        ],
      ),
      Positioned(
        bottom: -1 * screenSize.height * 0.03, // Position it at the bottom
        left: screenSize.width * 0.05, // Offset from the left edge
        right: screenSize.width * 0.05, // Offset from the right edge
        child: Container(
          height: 60, // Height of the search bar
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
      color: Color(0xff357C93), // Set the border color
      width: 4.0, // Set the border width as needed
    ),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(iconSize: screenSize.width*0.1, icon: Icon(Icons.search), onPressed: (){}, color: Color(0xff357C93)),
                border: InputBorder.none, // Remove the border
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
)


              // child: Column(
              //   children: [
              //     // Add your search bar widget here
              //     TextField(
              //       decoration: InputDecoration(
              //         hintText: 'Search...',
              //         // Customize the search bar as needed
              //       ),
              //     ),
              //     // Heading
              //     Padding(
              //       padding: EdgeInsets.only(left: screenSize.width * 0.02),
              //       child: Text(
              //         'Your Heading',
              //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ],
              // ),
          ,
            
            // Rest of the content
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
