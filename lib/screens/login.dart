import 'package:flutter/material.dart';

import '../config/config.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('LOGIN', style: TextStyle(color: blueColor, fontSize: 34, fontWeight: FontWeight.bold, fontFamily: 'LemonMilk',), ),
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
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: Color(0xFF357C93),
                        fontWeight: FontWeight.w900),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.05),
                  ),
                  controller: emailController,
                ),
              ),
            ),
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
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Color(0xFF357C93),
                        fontWeight: FontWeight.w900),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.05),
                  ),
                  controller: passController,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
