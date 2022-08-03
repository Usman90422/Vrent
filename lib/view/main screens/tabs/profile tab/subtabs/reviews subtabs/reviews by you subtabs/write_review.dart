import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/heading.dart';

class WriteReview extends StatefulWidget {
  const WriteReview({Key? key}) : super(key: key);

  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackWithText(title: "Write a review"),
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
                      Heading(title: "Nobody to review right now."),
                      Heading(title: "Looks like it’s time for another trip!"),
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
