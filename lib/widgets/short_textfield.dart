import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShortTextField extends StatefulWidget {
  ShortTextField({
    Key? key,
    required this.hintText,
    this.onSubmit,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.inputType,
    this.onIconPressed,
    this.maxLength
  }) : super(key: key);

  final String hintText;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final VoidCallback? onIconPressed;
  final TextEditingController? controller;

  @override
  State<ShortTextField> createState() => _ShortTextFieldState();
}

class _ShortTextFieldState extends State<ShortTextField> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff3A3A3C),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          inputFormatters:[
            LengthLimitingTextInputFormatter( widget.maxLength),
          ],
          controller: widget.controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 15.0, color: Colors.white60,),
            border: InputBorder.none,
            contentPadding:  const EdgeInsets.all(0),
          ),
          onSubmitted: widget.onSubmit,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          keyboardType: widget.inputType,
        ),
      ),
    );
  }
}
