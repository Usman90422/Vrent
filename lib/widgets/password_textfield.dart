import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {

  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final TextEditingController? controller;

   PasswordTextField({Key? key,required this.hintText, this.onChanged, this.onSubmit, this.textInputAction, this.inputType, this.controller}) : super(key: key);


  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}


class _PasswordTextFieldState extends State<PasswordTextField> {

  var hidePassword = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff3A3A3C),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: widget.controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 15.0, color: Colors.white60),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 10, top: 12),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              }, icon: hidePassword ==true ? const Icon(Icons.visibility_off,color: Colors.white,):const Icon(Icons.visibility,color: Colors.white),),
          ),
          onSubmitted: widget.onSubmit,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          keyboardType: widget.inputType,
          obscureText: hidePassword,
        ),
      ),
    );
  }
}
