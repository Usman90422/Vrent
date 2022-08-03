import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/reviews%20subtabs/reviews_about_you.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/reviews%20subtabs/reviews_by_you.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/text_tile.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Column(
            children: [
              BackWithText(title: "Reviews",),
              const Divider(color: kDarkGrey,height: 5,thickness: 2,),
              TextTile(title: 'Reviews about you',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReviewsAboutYou()));
                  }),
              TextTile(title: 'Reviews By you',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReviewsByYou()));
                  }),


            ]),
      ),
    );
  }
}
