import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
   TextTile({ this.onTap,required this.title}) ;

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal:30 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: const TextStyle(color: Colors.white,fontSize: 16),),
            const Icon(Icons.arrow_forward_ios,color: Colors.white,),
          ],),
      ),
    );
  }
}
