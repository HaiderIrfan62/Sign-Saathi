import 'package:flutter/material.dart';
import 'package:sign_saathi_app/config/config.dart';
import 'package:sign_saathi_app/config/strings.dart';
import 'package:sign_saathi_app/utils/NavBar.dart';
import 'package:sign_saathi_app/utils/sidebarNprofile.dart';

import 'LessonPage.dart';

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
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SideBarNProfile(screenSize: screenSize, imagePath: 'lib/assets/avatar.png'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/character.png',
                      height: screenSize.height * 0.5,
                    ),
                    SizedBox(height: screenSize.height * 0.06),
                    Container(
                      width: screenSize.width * 0.95,
                      height: screenSize.height * 0.08,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF176B87),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.send,
                                  color: Color(0xFF176B87),
                                )),
                            hintText: AvatarPageSearch,
                            hintStyle: TextStyle(
                                color: Color(0xFF357C93),
                                fontWeight: FontWeight.w900),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.05),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: screenSize.height * 0.10),
                NavBar(screenSize: screenSize, pageName: PageNameAvatar),
              ]),

        ),
      ),
    );
  }
}
