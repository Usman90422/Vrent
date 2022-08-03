import 'dart:convert';
import 'package:http/http.dart'as http;

class LoginUser{

  String firstName='';
  String lastName='';
  String emailAddress='';
  String phone='';
  String carrierCode='';
  String country='';
  String oldPassword="";
  int id=0;
  String picUrl="";


  Future<String> login(String email, String password)async{
    var url=Uri.parse("http://web2.go4.homes/api/login");
    var response=await http.get(url);
    var data = json.decode(response.body);
    int flag = 0;
    for (int i = 0; i < data.length; i++) {
      if (email == data[i]["email"] && password == data[i]["password"]) {
        id=data[i]["id"];
        firstName=data[i]["first_name"];
       lastName=data[i]["last_name"];
       emailAddress=data[i]["email"];
       phone=data[i]["phone"];
       carrierCode=data[i]["carrier_code"];
       country=data[i]["default_country"];
       oldPassword=data[i]["password"];
        picUrl=data[i]["profile_image"];


        flag = 1;
      }
    }
    if (flag == 1) {
      return "found";
    }
    else
    {
      return "!found";
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  Future<String> emailCheck(String email)async{
    var url=Uri.parse("http://web2.go4.homes/api/login");
    var response=await http.get(url);
    var data = json.decode(response.body);
    int flag = 0;
    for (int i = 0; i < data.length; i++) {
      if (email == data[i]["email"] ) {
        flag = 1;
      }
    }
    if (flag == 1) {
      return "found";
    }
    else
    {
      return "!found";
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  Future<String?> changePassword(int id,String newPassword)async{
    var url=Uri.parse("http://web2.go4.homes/api/updatePassword/$id");
    var response=await http.post(url,body: {"password" : newPassword});
    if(response.statusCode!=200)
    {
      print("response error");
    }
    else {
      print("password changed successfully");
      return null;
    }
  }









}

