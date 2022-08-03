import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';

class BoldHeading extends StatelessWidget {
  const BoldHeading({
    this.color,
    required this.title,
  }) ;

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style:  TextStyle(
          color: color==null?kPrimaryColor:color,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}
