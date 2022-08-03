import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/controller/user_details.dart';
import 'package:vrent/view/main%20screens/tabs/explore%20tab/explore_tab.dart';
import 'package:vrent/view/main%20screens/tabs/inbox%20tab/inbox_tab.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/profile_tab.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/property_listing_tab.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}




class _MainMenuState extends State<MainMenu> {

  int currentTab = 0;

  final List<Widget> tabs = [
    const Explore(),
    const Inbox(),
    const Profile(),
    const PropertyListing()];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = const Explore();

  late SharedPreferences prefs;

  Future<dynamic> _getPrefs()  async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPrefs();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => prefs = prefs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              color: const Color(0xff3A3A3C),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentScreen = const Explore();
                        currentTab = 0;
                      });
                    },
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(
                            color: currentTab == 0 ? kButtonColor : Colors
                                .transparent, width: 3.0,),
                          )
                      ),
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.only(top: 10,),
                      child: Column(
                        children: [
                          currentTab == 0
                              ? const SizedBox(
                              width: 22,
                              child: Image(
                                  image: AssetImage('images/loupe_green.png')))
                              : const SizedBox(
                              width: 19,
                              child: Image(
                                  image: AssetImage('images/loupe_white.png'))),
                          // Icon(Icons.search,color: currentTab == 0 ? kButtonColor :Colors.white,size:currentTab == 0 ? 23:20,),
                          const SizedBox(height: 2),
                          Text("Explore", style: TextStyle(color: Colors.white,
                              fontSize: currentTab == 0 ? 12 : 10),),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = const PropertyListing();
                      currentTab = 1;
                    });
                  },
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: currentTab == 1
                            ? kButtonColor
                            : Colors.transparent, width: 3.0,),
                        )
                    ),
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.only(top: 10,),
                    child: Column(
                      children: [
                        // Icon(Icons.home,
                        //   color: currentTab == 1 ? kButtonColor : Colors.white,
                        //   size: currentTab == 1 ? 23 : 20,),
                        currentTab == 1
                            ? const SizedBox(
                            width: 22,
                            child: Image(
                                image: AssetImage('images/home_green.png')))
                            : const SizedBox(
                            width: 19,
                            child: Image(
                                image: AssetImage('images/home_white.png'))),
                        const SizedBox(height: 2),
                        Text("Add", style: TextStyle(color: Colors.white,
                            fontSize: currentTab == 1 ? 12 : 10),)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = const Inbox();
                      currentTab = 2;
                    });
                  },
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: currentTab == 2
                            ? kButtonColor
                            : Colors.transparent, width: 3.0,),
                        )
                    ),
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.only(top: 10,),
                    child: Column(
                      children: [
                        // Icon(Icons.inbox,
                        //   color: currentTab == 2 ? kButtonColor : Colors.white,
                        //   size: currentTab == 2 ? 23 : 20,),
                        currentTab == 2
                            ? const SizedBox(
                            width: 22,
                            child: Image(
                                image: AssetImage('images/inbox_green.png')))
                            : const SizedBox(
                            width: 19,
                            child: Image(
                                image: AssetImage('images/inbox_white.png'))),
                        const SizedBox(height: 2),

                        Text("Inbox", style: TextStyle(color: Colors.white,
                            fontSize: currentTab == 2 ? 12 : 10),)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen =   Profile(preferences: prefs);
                      currentTab = 3;
                    });
                  },
                  child: Container(
                    width: 50,

                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: currentTab == 3
                            ? kButtonColor
                            : Colors.transparent, width: 3.0,),
                        )
                    ),
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.only(top: 10,),
                    child: Column(
                      children: [
                        // Icon(Icons.person,
                        //   color: currentTab == 3 ? kButtonColor : Colors.white,
                        //   size: currentTab == 3 ? 23 : 20,),
                        currentTab == 3
                            ? const SizedBox(
                            width: 22,
                            child: Image(
                                image: AssetImage('images/user_green.png')))
                            : const SizedBox(
                            width: 19,
                            child: Image(
                                image: AssetImage('images/user.png'))),
                        const SizedBox(height: 2),
                        Text("Profile", style: TextStyle(color: Colors.white,
                            fontSize: currentTab == 3 ? 12 : 10),),
                      ],
                    ),
                  ),
                ),
              ],),
          ),
        ),
      ),
    );
  }
}
