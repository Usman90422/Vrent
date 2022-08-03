import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';

class MyCheckBox extends StatelessWidget {
   const MyCheckBox({
     this.textColor,
    required this.value,
    required this.onChanged,
     required this.title,
     this.trailingStyle,
  }) ;

  final bool value;
  final ValueChanged onChanged;
  final String title;
  final Color? textColor;
  final bool? trailingStyle;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: textColor==null ?kButtonColor:textColor,
      controlAffinity: trailingStyle==false ?ListTileControlAffinity.leading:ListTileControlAffinity.trailing,
      value: value,
      onChanged: onChanged,
      title: Text(title,style: TextStyle(color: textColor==null? Colors.white:textColor),),
    );
  }
}
