 import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';

class Button extends StatelessWidget {
   Button({required this.onPressed,required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: ElevatedButton(
        onPressed: onPressed,
      child:  Text(text),
        style: ElevatedButton.styleFrom(
            primary: kButtonColor,
            fixedSize: const Size(320, 50),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}

