import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/payout%20subtab/payout_settings.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/text_tile.dart';

class Payouts extends StatefulWidget {
  const Payouts({Key? key}) : super(key: key);

  @override
  _PayoutsState createState() => _PayoutsState();
}

class _PayoutsState extends State<Payouts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackWithText(title: "Payouts",),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PayoutSettings()));
                    }, icon: const Icon(Icons.settings,color: Colors.white,)),
                  )
                ],
              ),
              const Divider(color: kDarkGrey,height: 5,thickness: 2,),


            ]),
      ),
    );
  }
}
