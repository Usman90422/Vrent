import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';

class ProfileVerification extends StatefulWidget {
  const ProfileVerification({Key? key}) : super(key: key);

  @override
  _ProfileVerificationState createState() => _ProfileVerificationState();
}

class _ProfileVerificationState extends State<ProfileVerification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackWithText(title: "Profile Verification"),
              const Divider(color: kDarkGrey,height: 5,thickness: 2,),
              const SizedBox(height: 20,),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: BoldHeading(title: 'Your Current Verifications',),
              ),
              const SizedBox(height: 20,),
              const Heading(title: "No Verifications at the moment"),
              Line(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: BoldHeading(title: 'Add Verifications',),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("Email", style: TextStyle(color: kPrimaryColor,fontSize: 15,)),
                    ElevatedButton(
                      onPressed: (){},
                      child:  const Text("Connect"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          fixedSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    )
                ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("Facebook", style: TextStyle(color: kPrimaryColor,fontSize: 15,)),
                    ElevatedButton(
                      onPressed: (){},
                      child:  const Text("Connect"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          fixedSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    )
                  ],),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("Gmail", style: TextStyle(color: kPrimaryColor,fontSize: 15,)),
                    ElevatedButton(
                      onPressed: (){},
                      child:  const Text("Connect"),
                      style: ElevatedButton.styleFrom(
                          primary: kButtonColor,
                          fixedSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    )
                  ],),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
