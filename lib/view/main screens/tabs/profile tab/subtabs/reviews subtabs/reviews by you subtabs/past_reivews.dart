import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/heading.dart';

class PastReviews extends StatefulWidget {
  const PastReviews({Key? key}) : super(key: key);

  @override
  _PastReviewsState createState() => _PastReviewsState();
}

class _PastReviewsState extends State<PastReviews> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackWithText(title: "Past reviews"),
              const Divider(color: kDarkGrey,height: 5,thickness: 2,),
              const SizedBox(height: 20,),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                        width: size.width*0.5,
                        child: const Image(image: AssetImage("images/noDataWhite.png"))),
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const[
                      Heading(title: "You haven\'t reviewed anyone"),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
