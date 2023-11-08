import 'package:flutter/material.dart';

import 'AvatarPage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AvatarPage(),
            ),
          );
        },
        child: Text('Continue')),
      ),
    );
  }
}
