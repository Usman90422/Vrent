import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/dashboard_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
                BackWithText(title: "Dashboard",),
              const Divider(color: kDarkGrey,height: 5,thickness: 2,),
              const DashboardCard(imagePath: 'images/list.png', title: 'My Lists', text: '0',),
              const DashboardCard(imagePath: 'images/trip.png', title: 'Trips', text: '0',),
              const DashboardCard(imagePath: 'images/wallet.png', title: 'My Wallet', text: '\$ 0',),

            ]
          ),
        ),
        ),

    );
  }
}


