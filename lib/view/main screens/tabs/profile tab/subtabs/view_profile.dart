import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/view%20profile%20subtabs/change_password.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/view%20profile%20subtabs/edit_profile.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/view%20profile%20subtabs/profile_picture.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/view%20profile%20subtabs/profile_verification.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/text_tile.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Column(
            children: [
              BackWithText(title: "Profile",),
              const Divider(color: kDarkGrey,height: 5,thickness: 2,),
              TextTile(title: 'Edit profile',
                  onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditProfile()));
              }),
              TextTile(title: 'Profile Picture',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfilePicture()));
                  }),
              TextTile(title: 'Profile verification',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileVerification()));
                  }),
              TextTile(title: 'Change password',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChangePassword()));
                  }),

            ]),
      ),
    );
  }
}

