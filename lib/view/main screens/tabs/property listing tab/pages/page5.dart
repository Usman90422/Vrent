import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/providers/page_provider.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/button_with_icon.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/mycheckbox.dart';
import 'package:vrent/widgets/mytextfield.dart';


class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  _Page5State createState() => _Page5State();
}

PagesProvider pageControllerProvider=PagesProvider();


class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    final pagesProvider= Provider.of<PagesProvider>(context);
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
                child: BoldHeading(title: 'Common Inclusions')),
            const SizedBox(height: 20),

            Wrap(
              children: [
                Container(
                  width: size.width*0.5,
                  child: Column(
                    children: [
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,1);},
                        title: 'Essentials', value: pagesProvider.essentials,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,3);},
                        title: 'Cable Tv', value: pagesProvider.cableTv,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,5);},
                        title: 'Kitchen', value: pagesProvider.kitchen,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,7);},
                        title: 'Gym', value: pagesProvider.gym,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,9);},
                        title: 'Indoor Fireplace', value: pagesProvider.indoorFirePlace,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,11);},
                        title: 'Doorman', value: pagesProvider.doorman,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,13);},
                        title: 'Wireless Internet', value: pagesProvider.wirelessInternet,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,15);},
                        title: 'Washer', value: pagesProvider.washer,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,17);},
                        title: 'Dryer', value: pagesProvider.dryer,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,19);},
                        title: 'Free Parking', value: pagesProvider.freeParking,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,21);},
                        title: 'Smoking Allowed', value: pagesProvider.smokingAllowed,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,23);},
                        title: 'Pets Allowed', value: pagesProvider.petsAllowed,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,25);},
                        title: 'Wheel-chair Accessible', value: pagesProvider.wheelChairAccessible,),
                    ],
                  ),
                ),
                Container(
                  width: size.width*0.5,
                  child: Column(
                    children: [
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,2);},
                        title: 'Tv', value: pagesProvider.tv,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,4);},
                        title: 'Air conditioner', value: pagesProvider.airConditioning,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,6);},
                        title: 'Internet', value: pagesProvider.internet,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,8);},
                        title: 'Elevator', value: pagesProvider.elevator,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,10);},
                        title: 'Buzzer/Intercom', value: pagesProvider.buzzer,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,12);},
                        title: 'Shampoo', value: pagesProvider.shampoo,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,14);},
                        title: 'Jacuzzi', value: pagesProvider.jacuzzi,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,16);},
                        title: 'Pool', value: pagesProvider.pool,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,18);},
                        title: 'Breakfast', value: pagesProvider.breakfast,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,20);},
                        title: 'Family/kid friendly', value: pagesProvider.familyFriendly,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,22);},
                        title: 'Suitable for events ', value: pagesProvider.suitableForEvents,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,24);},
                        title: 'Pets On Property', value: pagesProvider.petsOnProperty,),
                      MyCheckBox(onChanged: (value) {pagesProvider.commonInclusionsCheck(value!,26);},
                        title: 'Fireplace', value: pagesProvider.firePlace,),
                    ],
                  ),
                ),


              ],

            ),

            const Line(),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: BoldHeading(title: 'Safety Inclusions')),
            const SizedBox(height: 20),
            Wrap(
              children: [
                Container(
                  width: size.width*0.5,
                  child: Column(
                    children: [
                      MyCheckBox(onChanged: (value) {pagesProvider.safetyInclusionsCheck(value!,1);},
                        title: 'Smoke Detector', value: pagesProvider.smokeDetector,),
                      MyCheckBox(onChanged: (value) {pagesProvider.safetyInclusionsCheck(value!,3);},
                        title: 'First Aid Kit', value: pagesProvider.firstAidKit,),
                      MyCheckBox(onChanged: (value) {pagesProvider.safetyInclusionsCheck(value!,5);},
                        title: 'Fire \ Extingui-\ sher', value: pagesProvider.fireExtinguisher,),

                    ],
                  ),
                ),
                Container(
                  width: size.width*0.5,
                  child: Column(
                    children: [
                      MyCheckBox(onChanged: (value) {pagesProvider.safetyInclusionsCheck(value!,2);},
                        title: 'Carbon Monoxide Detector', value: pagesProvider.carbonMonoDetector,),
                      MyCheckBox(onChanged: (value) {pagesProvider.safetyInclusionsCheck(value!,4);},
                        title: 'Safety Card', value: pagesProvider.safetyCard,),
                    ],
                  ),
                ),
              ],
            ),
            Line(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIcon(
                      isBack:true,
                      text: 'Back',
                      goToPage: 3,
                      Width: size.width*0.4,
                      color: Colors.red,
                      icon:  const Icon(Icons.arrow_back_sharp,color: Colors.white,)),
                  ButtonWithIcon(
                      isBack:false,
                      text: 'Next',
                      goToPage: 5,
                      Width: size.width*0.4,
                      color: kButtonColor,
                      icon:  const Icon(Icons.arrow_forward,color: Colors.white,)),

                ],),
            ),


          ],
        ));
  }
}

