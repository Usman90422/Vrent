import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/controller/user_details.dart';
import 'package:vrent/controller/user_profile_update.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/mybutton.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {

  File? profilePic;
  // late String img="";

  Future uploadProfilePicture()async{
  var image= await ImagePicker().pickImage(source: ImageSource.gallery);
  profilePic=File(image!.path);
  setState(() {});
  }

  final userDetails=UserDetails();
  final profileUpdate=ProfileUpdate();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDetails.getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
            BackWithText(title: "Profile Picture",),
           const Divider(color: kDarkGrey,height: 5,thickness: 2,),
          const SizedBox(height: 20,),
            Stack(
              children: [
               profileUpdate.path.isEmpty ? ClipOval(
                  child: Container(
                    child: profilePic==null
                       ? const Image(image: AssetImage("images/dummy.png"), width: 150, height: 150, fit: BoxFit.contain,)
                       : Image.file(File(profilePic!.path),fit: BoxFit.cover, width: 150, height: 150),
                  ),
                )
                   : ClipOval(
                 child: Container(
                   child: Image.network("http://web2.go4.homes/storage/${profileUpdate.path}"),
                 ),
               ),

                profilePic==null
                    ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: (){
                        uploadProfilePicture();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration:  const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      child: const Icon(Icons.add,color: Colors.black,),
                      ),
                    ),
                )
                    :Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        profilePic=null;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration:  const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.remove,color: Colors.red,),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const Heading(title: "Please upload a clear photo to help hosts and guests to learn about each other."),
            const SizedBox(height: 20,),
            Button(onPressed: () async {
              if(profilePic!=null){
                await profileUpdate.updatePicture(profilePic!, userDetails.id);
              }
              print("empty image");

            }, text: 'Save',),

          SizedBox(height: 20),


        ],
        ),
      ),
    );
  }
}
