import 'package:flutter/material.dart';
import 'package:sign_saathi_app/utils/NavBar.dart';
import 'package:sign_saathi_app/utils/sidebarNprofile.dart';
import 'package:sign_saathi_app/config/strings.dart';

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
      backgroundColor: Color(0xFFF6F4EB),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SideBarNProfile(
                screenSize: screenSize, imagePath: 'lib/assets/avatar1.png'),
            // Rectangle with search bar just below the top two icons
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(
                    screenSize.width * 0.05, 0, screenSize.width * 0.05, 0),
                    height: screenSize.height * 0.24,
                    width: screenSize.width * 0.9,
                    // 1/4th of the screen
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
                                  padding: EdgeInsets.only(
                                      left: screenSize.width * 0.05),
                                  // Adjust the left padding as needed
                                  child: Text(
                                    "LET'S LEARN TOGETHER",
                                    style: TextStyle(
                                      fontFamily: 'LemonMilk',
                                      // Use the defined font family
                                      fontSize: 28,
                                      // Change the font size as needed
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
                          bottom: -1 * screenSize.height * 0.04,
                          // Position it at the bottom
                          left: screenSize.width * 0.05,
                          // Offset from the left edge
                          right: screenSize.width * 0.05,
                          // Offset from the right edge
                          child: Container(
                            height: 60, // Height of the search bar
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: Color(0xff357C93),
                                // Set the border color
                                width: 4.0, // Set the border width as needed
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      iconSize: screenSize.width * 0.1,
                                      icon: Icon(Icons.search),
                                      onPressed: () {},
                                      color: Color(0xff357C93)),
                                  border: InputBorder.none, // Remove the border
                                  contentPadding: EdgeInsets.all(16.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(screenSize.width * 0.05,
                        screenSize.height * 0.05, screenSize.width * 0.05, 0),
                    height: screenSize.height * 0.20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Heading
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              screenSize.width * 0.02,
                              screenSize.height * 0.01,
                              screenSize.width * 0.02,
                              0),
                          child: Text(
                            'CATEGORIES',
                            style: TextStyle(
                              color: Color(0xFF357C93),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        // Row of square boxes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildSquareBox(screenSize, 'Maths',
                                'lib/assets/Matemathic.png'),
                            _buildSquareBox(screenSize, 'Geography',
                                'lib/assets/Globe.png'),
                            _buildSquareBox(screenSize, 'Science',
                                'lib/assets/Knowledge.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Additional section 2
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        screenSize.width * 0.05, 0, screenSize.width * 0.05, 0),

                    height: screenSize.height * 0.25,
                    // Adjust the height as needed
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Heading
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenSize.width * 0.02,
                              0, screenSize.width * 0.02, 0),
                          child: Text(
                            'COURSES',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF357C93),
                            ),
                          ),
                        ),
                        //   Rectangle with rounded edges
                        Container(
                          margin: EdgeInsets.only(
                              left: screenSize.width * 0.02,
                              right: screenSize.width * 0.02,
                              top: screenSize.height * 0.02),
                          width: screenSize.width * 0.85,
                          height: screenSize.height * 0.18,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey, // Shadow color
                                offset: Offset(3.0, 3.0), // Shadow offset
                                blurRadius: 6.0, // Shadow blur radius
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left Section
                              Expanded(
                                flex: 6, // Takes up 60% of the width
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      screenSize.width * 0.04,
                                      screenSize.height * 0.02,
                                      0,
                                      0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ENGLISH READING',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF176B87)),
                                      ),

                                      SizedBox(
                                          height: screenSize.height * 0.01),
                                      // Start Button
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "START",
                                          style: TextStyle(fontSize: 14, color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          backgroundColor: Color(0xFF357C93),
                                          padding: EdgeInsets.only(
                                              left: 30,
                                              top: 8,
                                              right: 30,
                                              bottom: 8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Right Section
                              Expanded(
                                flex: 5, // Takes up 40% of the width
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF053B50),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: screenSize.width * 0.2,
                                      height: screenSize.height * 0.2,
                                      child: Center(
                                        child: Image.asset(
                                            'lib/assets/ion_book-outline.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

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

                  // Rest of the content
                ],
              ),
            ),
            NavBar(screenSize: screenSize, pageName: PageNameLessons),
            SizedBox(height: screenSize.height * 0.01),
          ],
        ),
      ),
    );
  }
}

Widget _buildSquareBox(Size screenSize, String text, String imagePath) {
  return Container(
    width: screenSize.width * 0.25, // Adjust the width as needed
    height: screenSize.width * 0.25, // Make it square
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey, // Shadow color
          offset: Offset(3.0, 3.0), // Shadow offset
          blurRadius: 6.0, // Shadow blur radius
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: screenSize.width * 0.15, // Adjust image size as needed
        ),
        Text(text,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ],
    ),
  );
}
