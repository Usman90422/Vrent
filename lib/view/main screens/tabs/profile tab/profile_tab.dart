import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/controller/user_details.dart';
import 'package:vrent/controller/user_profile_update.dart';
import 'package:vrent/view/login/login_screen.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/payouts.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/dashboard.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/reviews.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/view_profile.dart';
import 'package:vrent/widgets/icon_tile.dart';
import 'package:vrent/widgets/line.dart';

class Profile extends StatefulWidget {
   const Profile({Key? key,this.preferences }) : super(key: key) ;

   final SharedPreferences? preferences;


  @override
  _ProfileState createState() => _ProfileState(preferences!);
}


class _ProfileState extends State<Profile> {

  final profileUpdate=ProfileUpdate();
  final userDetails=UserDetails();

  _ProfileState(SharedPreferences preferences);



  @override
  Widget build(BuildContext context) {
    final userDetails= Provider.of<UserDetails>(context);
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Row(
                children: [
                        SizedBox(
                          width: size.width*0.35,
                          height: 100,
                          child:  const CircleAvatar(
                           child:  Image(image: AssetImage("images/dummy.png")),
                          ),
                        ),
                        SizedBox(
                          width: size.width*0.5,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                  Text(widget.preferences!.getString("firstName")?? "Name",style: const TextStyle(color: Colors.white,fontSize: 24),),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => const ViewProfile()) );
                                  },
                                  child: const Text(
                                    "View Profile",
                                    style: TextStyle(color: kButtonColor,fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),
                ],
              ),
            ),
              const Line(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                child: Column(
                  children: [
                    IconTile(
                      imagePath: 'images/dash_white.png',
                      text: 'Dashboard',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboard()));
                      }
                      ),
                    IconTile(
                        imagePath: 'images/list.png',
                        text: 'Listings',
                        onTap: () {}
                    ),
                    IconTile(
                        imagePath: 'images/bookmark.png',
                        text: 'Bookings',
                        onTap: () {}
                    ),
                    IconTile(
                        imagePath: 'images/trip.png',
                        text: 'Trips',
                        onTap: () {}
                    ),
                    IconTile(
                        imagePath: 'images/debit_white.png',
                        text: 'Payouts',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Payouts()));
                        }
                    ),
                    IconTile(
                        imagePath: 'images/transaction_white.png',
                        text: 'Transactions',
                        onTap: () {}
                    ),
                    IconTile(
                        imagePath: 'images/reviews.png',
                        text: 'Reviews',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Reviews()));
                        }
                    ),
                   const Line(),
                    InkWell(
                onTap: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                   prefs.clear();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) =>Login()), (Route<dynamic> route) => false);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
                  },
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 26,
                        width: size.width*0.2,
                        child:  const Image(image: AssetImage('images/logout.png'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10,top: 0),
                        child: SizedBox(
                            width: size.width*0.5,
                            child:  const Text("Logout",style: TextStyle(color: Colors.white,fontSize: 15),)),
                      ),

                    ],),
                ),
                ),
                    const Line(),
                    const Center(child: Text("Version 0.0.1",style: TextStyle(color: Colors.white),),),
                    const SizedBox(height: 20,),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

