import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';


class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.title,
    this.color,

  }) : super(key: key);

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(title,
          style:  TextStyle(
            color: color==null?kPrimaryColor:color,
            fontSize: 15,
          )),
    );
  }
}