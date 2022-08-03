import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/reviews%20subtabs/reviews%20by%20you%20subtabs/expired_reviews.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/reviews%20subtabs/reviews%20by%20you%20subtabs/past_reivews.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/reviews%20subtabs/reviews%20by%20you%20subtabs/write_review.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/text_tile.dart';

class ReviewsByYou extends StatefulWidget {
  const ReviewsByYou({Key? key}) : super(key: key);

  @override
  _ReviewsByYouState createState() => _ReviewsByYouState();
}

class _ReviewsByYouState extends State<ReviewsByYou> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  BackWithText(title: "Reviews by you"),
              const Divider(color: kDarkGrey,height: 5,thickness: 2,),
              TextTile(title: "Write Review",onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const WriteReview()));

              },),

              TextTile(title: "Past Reviews",onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PastReviews()));

              },),

              TextTile(title: "Expired Reviews",onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExpiredReviews()));

              },),

            ],
          ),
        ),
      ),
    );
  }
}
