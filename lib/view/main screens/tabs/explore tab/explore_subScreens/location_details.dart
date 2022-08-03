import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/view/main%20screens/tabs/explore%20tab/explore_subScreens/booking_screen.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/carousel.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/icon_tile.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/location_text.dart';
import 'package:vrent/widgets/mybutton.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({Key? key}) : super(key: key);

  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {


  List images = [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    Carousel(imageList: images,height: 250,indicatorPosition: 200,),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                          decoration:  BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                                },
                              icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                      ),
                    ),

                  ],),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const BoldHeading(title: 'Luxury Resort Room' ),
                        const SizedBox(height: 10),
                        const LocationText(title: 'Bali Island',fontSize: 20),
                        const Line(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Column(children: const [
                                Icon(Icons.people, color: kButtonColor),
                                Text("5 Guests",
                                  style: TextStyle(color: Colors.white),),
                              ],),

                              const SizedBox(width: 4,),
                              Column(children: const [
                                Icon(Icons.hotel, color: kButtonColor),
                                Text("3 Bedrooms",
                                  style: TextStyle(color: Colors.white),),
                              ],),
                              const SizedBox(width: 4,),
                              Column(children: const [
                                Icon(Icons.bathtub, color: kButtonColor),
                                Text("2 Bathrooms",
                                  style: TextStyle(color: Colors.white),),
                              ],),
                            ],),
                        ),
                        const Line(),
                        const BoldHeading(title: 'Description' ),
                        const SizedBox(height: 10),
                         const Text(dummyDescription,style : TextStyle(fontSize: 12,color: Colors.white)),
                        const Line(),
                        const BoldHeading(title: 'Inclusions' ),
                        const SizedBox(height: 10),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                           Row(
                               children:const [
                             Icon(Icons.wifi,color: kPrimaryColor,), Heading(title: "Free Wifi",),
                             Icon(Icons.directions_car_outlined,color: kPrimaryColor,), Heading(title: "Free Parking",),
                           ]),
                            SizedBox(height: 10,),
                            Row(
                                children:const [
                                  Icon(Icons.ac_unit,color: kPrimaryColor,), Heading(title: "Air conditioned",),
                                  Icon(Icons.kitchen,color: kPrimaryColor,), Heading(title: "Kitchen",),
                                ]),

                          ],),

                        const Line(),
                        const BoldHeading(title: 'Extras' ),
                        const SizedBox(height: 10),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Row(
                                children:const [
                                  Icon(Icons.pool,color: kPrimaryColor,), Heading(title: "Pool"),
                                  Icon(Icons.tv,color: kPrimaryColor,), Heading(title: "Tv"),
                                ]),
                          ],),
                        const Line(),
                        const BoldHeading(title: 'Reviews' ),
                        const SizedBox(height: 10),
                        const Text("No review yet",style: TextStyle(color: Colors.white),),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 60,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Text('\$30 /', style: TextStyle(
                          color: Colors.white, fontSize: 15),),
                      Container(
                          width: 25,
                          child: const Image(image: AssetImage( "images/moon.png"),)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookingScreen()));
                    },
                      style: ElevatedButton.styleFrom(
                          primary: kButtonColor,
                          fixedSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      child: const Text("Book Now"),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

//
// Positioned(
// bottom: 0,
// child: Center(child: Button(text: 'Book Now',onPressed: (){},))),