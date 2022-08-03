import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileUpdate {

  Future updatePicture(File image,int id) async {
    var url = Uri.parse("http://web2.go4.homes/api/updatePP/$id");
    var request=http.MultipartRequest("POST",url);
    var pic= await http.MultipartFile.fromPath("image", image.path);
    request.files.add(pic);
    var response= await request.send();
    if(response.statusCode==200)
      {
        print("image uploaded");
      }
    else{
      print("upload failed");
    }

  }


   String path="";
  String pic="";

  Future<String> retrieveImage(int id) async{
    var url=Uri.parse("http://web2.go4.homes/api/retrievePP/$id");
    var response=await http.get(url);
    var data = json.decode(response.body);
    path=data[0]["profile_image"];
    pic=path.replaceAll("public/","");
    return pic;
  }


  Future removeProfilePic(int id)async{
    var url=Uri.parse("http://web2.go4.homes/api/removePP/$id");
    var response=await http.post(url);
    path="";
    pic="";
    if(response.statusCode==200)
      {
        print("removed");
      }
    else{
      print("error");
    }
  }



  Future getUserInfo(int id)async{
    var url=Uri.parse("http://web2.go4.homes/api/getUserInfo/$id");
    var response=await http.get(url);
    var data = json.decode(response.body);
    print(data);
  }






}