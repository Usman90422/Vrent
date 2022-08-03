import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dialogs{

  SuccessDialog(BuildContext context) async => await AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      borderSide: const BorderSide(color: Colors.black, width: 2),
      width: 300,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      desc: 'User Registered Successfully',
      autoHide: const Duration(seconds: 5),
    ).show();


  FailureDialog(BuildContext context) async => await AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      borderSide: const BorderSide(color: Colors.black, width: 2),
      width: 300,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      desc: 'Registration Failed',
      autoHide: const Duration(seconds: 5),
  ).show();


  UserNotFoundDialog(BuildContext context) async => await AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      borderSide: const BorderSide(color: Colors.black, width: 2),
      width: 300,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      desc: 'User does not exist, Recheck your email and password and try again',
      autoHide: const Duration(seconds: 5),
  ).show();


  void fillAllFieldsToast() {
      Fluttertoast.showToast(
          msg: 'Fill the required fields to proceed',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
      );
  }

  void showToast(String toastMsg) {
      Fluttertoast.showToast(
          msg: toastMsg,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
      );
  }


}