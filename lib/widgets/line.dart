import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      child: Divider(thickness: 2,color: kDarkGrey,),
    );
  }
}
