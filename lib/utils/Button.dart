import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text;

  Button({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      child: Text(text, style: TextStyle(fontSize: 24),),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        backgroundColor: color,
        padding: EdgeInsets.only(left: 50, top: 12, right: 50, bottom: 12),
      ),
    );
  }
}
