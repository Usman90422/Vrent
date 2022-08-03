import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends ChangeNotifier{

  String firstName="";
  String lastName='';
  String emailAddress='';
  String phone='';
  String carrierCode='';
  String country='';
  String picUrl="";
   int id=0;



  void getPrefs()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
      firstName=prefs.getString("firstName")!;
      lastName=prefs.getString("lastName")!;
      emailAddress=prefs.getString("email")!;
      phone=prefs.getString("phone")!;
      carrierCode=prefs.getString("code")!;
      country=prefs.getString("country")!;
      id=prefs.getInt("id")!;
      picUrl=prefs.getString("picUrl")!;
      notifyListeners();
  }



}