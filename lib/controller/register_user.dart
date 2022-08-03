import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:vrent/models/users.dart';

class RegisterUser{

   Future<User?> register(Map userDetail) async {

     var url=Uri.parse("http://web2.go4.homes/public/api/register");
     var response=await http.post(url,body: userDetail);
     if(response.statusCode!=200)
     {
       print("response error");
     }
     else {
       print("Registered");
       return null;
     }


   }


}