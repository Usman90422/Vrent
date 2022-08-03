import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrent/controller/user_details.dart';
import 'package:vrent/view/login/login_screen.dart';

import 'main screens/main_menu.dart';


class Splash_Screen extends StatefulWidget {

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();

}

class _Splash_ScreenState extends State<Splash_Screen> {



  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var id = prefs.getInt('id');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> id==null? const Login():const MainMenu()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 40, top: 60, right: 40, bottom: 20),
            child: Hero(
                tag: "logo",
                child: Image(image: AssetImage("images/vrent_logo.png"))),
          ),
        ),
      ),
    );
  }


}
