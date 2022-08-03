import 'package:flutter/material.dart';

class LocationText extends StatelessWidget {
  const LocationText({required this.title,this.boldTitle,this.fontSize,this.Width}) ;

  final String title;
  final bool? boldTitle;
  final double? fontSize;
  final Width;

  @override
  Widget build(BuildContext context) {
    return Row(children:  [
      const Icon(Icons.location_on, color: Colors.red,),
      const SizedBox(width: 5),
      SizedBox(
        width: Width ?? 250,
        child: Text(title,
          style:  TextStyle(color: Colors.white,
            overflow: TextOverflow.ellipsis,
            fontSize: fontSize ?? 15,
            fontWeight: boldTitle==true ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),

    ],);
  }
}
