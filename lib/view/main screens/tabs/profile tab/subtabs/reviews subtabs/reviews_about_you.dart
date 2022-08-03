import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/heading.dart';

class ReviewsAboutYou extends StatefulWidget {
  const ReviewsAboutYou({Key? key}) : super(key: key);

  @override
  _ReviewsAboutYouState createState() => _ReviewsAboutYouState();
}

class _ReviewsAboutYouState extends State<ReviewsAboutYou> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackWithText(title: "Reviews about you"),
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
                  const Center(child: Heading(title: "No one has reviewed you yet"),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
