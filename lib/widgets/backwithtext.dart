import 'package:flutter/material.dart';

class BackWithText extends StatelessWidget {
  BackWithText({required this.title});

final String title;

@override
Widget build(BuildContext context) {
  return Padding(
    padding:  const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
    child: Row(children: [
      IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_outlined),color: Colors.white,),
      Text(title,style: const TextStyle(color: Colors.white,fontSize: 20),)
    ],),
  );
}
}
