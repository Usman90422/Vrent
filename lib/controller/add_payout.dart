import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class AddPayout {
  
  
  Future addPayoutMethod(Map paymentMethod,int userId,int type)async{
    var url=Uri.parse("http://web2.go4.homes/public/api/addPayout/userId/type");
    var response=await http.post(url,body: paymentMethod);
    if(response.statusCode==200)
    {
      print("Method Added");
    }
    else {
      print("response error");
    }

  }
  
}