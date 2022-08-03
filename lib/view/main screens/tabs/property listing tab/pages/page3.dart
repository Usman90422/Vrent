import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/button_with_icon.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/mytextfield.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(height: 20),

            //Title
            const Center(
              child: BoldHeading(title: 'List your space'),
            ),

            const Line(),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: BoldHeading(title: 'Description')),
            const SizedBox(height: 20),

            const Heading(title: "Listing Name"),
            const SizedBox(height: 20),
            const MyTextField(hintText: "Enter a name "),


            const SizedBox(height: 20),
            const Heading(title: "Summary"),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(vertical: 10,),
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xff3A3A3C),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Tell travelers about your space and \n hosting style.",
                    hintStyle: TextStyle(
                        fontSize: 15.0, color: Colors.white60),
                    border: InputBorder.none,
                    contentPadding:  EdgeInsets.only(left: 10),
                  ),

                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIcon(
                      isBack:true,
                      text: 'Back',
                      goToPage: 1,
                      Width: size.width*0.4,
                      color: Colors.red,
                      icon:  const Icon(Icons.arrow_back_sharp,color: Colors.white,)),
                  ButtonWithIcon(
                      isBack:false,
                      text: 'Next',
                      goToPage: 3,
                      Width: size.width*0.4,
                      color: kButtonColor,
                      icon:  const Icon(Icons.arrow_forward,color: Colors.white,)),

                ],),
            ),


          ],
        ));
  }
}
