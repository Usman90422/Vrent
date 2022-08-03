import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/view/main%20screens/tabs/explore%20tab/explore_subScreens/location_details.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/carousel.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/location_text.dart';
import 'package:vrent/widgets/mybutton.dart';
import 'package:vrent/widgets/mycheckbox.dart';
import 'package:vrent/widgets/range_slider.dart';

import '../explore_tab.dart';

class SearchedLocations extends StatefulWidget {
  const SearchedLocations({required this.location});

  final String location;

  @override
  _SearchedLocationsState createState() => _SearchedLocationsState(location);
}

class _SearchedLocationsState extends State<SearchedLocations> {
  _SearchedLocationsState(this.location);

  final String location;
  bool instantBook = false;
  bool requestToBook = false;

  RangeValues rangeValues = RangeValues(20, 1000);

  String start = "";
  String end = "";

  List images = [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
  ];
  List imagess = [
    "images/6.jpg",
    "images/4.jpg",
    "images/5.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackWithText(title: "Search"),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SearchFilterBottomSheet(context);
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: SizedBox(
                          height: 25,
                          child: Image(image: AssetImage('images/filter.png'))),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BoldHeading(title: "${location}"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const LocationDetails()));
                      },
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: kDarkGrey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Carousel(imageList: images,isDetailScreen: false,),
                            Padding(
                              padding: const EdgeInsets.only( top: 10, left: 20, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 200,
                                    child: Text("Luxury Resort Room",
                                      style: TextStyle(color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text('\$30 /', style: TextStyle(
                                          color: Colors.white, fontSize: 15),),
                                      Container(
                                          width: 25,
                                          child: const Image(image: AssetImage( "images/moon.png"),)),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child:  LocationText(title: "Bali Island"),
                            ),

                          ],
                        ),
                      ),
                    ),


                    const SizedBox(height: 20,),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const LocationDetails()));
                      },
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: kDarkGrey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Carousel(imageList: imagess,isDetailScreen: false,),
                            Padding(
                              padding: const EdgeInsets.only( top: 10, left: 20, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 200,
                                    child: Text("Luxury Resort Room",
                                      style: TextStyle(color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text('\$50 /', style: TextStyle(
                                          color: Colors.white, fontSize: 15),),
                                      Container(
                                          width: 25,
                                          child: const Image(image: AssetImage( "images/moon.png"),)),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(children: const [
                                Icon(Icons.location_on, color: Colors.red,),
                                SizedBox(width: 5),
                                SizedBox(
                                  width: 250,
                                  child: Text("Istanbul, Turkey",
                                    style: TextStyle(color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),

                              ],),
                            ),

                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SearchFilterBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext c) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    const Center(child: BoldHeading(
                      title: 'Search Filters', color: Colors.black,),),
                    Line(),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Booking Type', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        children: [
                          MyCheckBox(
                            trailingStyle: true,
                            onChanged: (value) {
                              setState(() {
                                instantBook = value;
                              });
                            },
                            title: 'Instant Book',
                            value: instantBook,
                            textColor: Colors.black,
                          ),

                          MyCheckBox(
                            trailingStyle: true,
                            onChanged: (value) {
                              setState(() {
                                requestToBook = value;
                              });
                            },
                            title: 'Request To Book',
                            value: requestToBook,
                            textColor: Colors.black,
                          ),
                        ],
                      ),
                    ),

                    Line(),

                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text('Price Range', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Row(children: [
                        Container(
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(
                            "${start == "" ? "20" : start} \$ ",
                            style: TextStyle(color: Colors.white),)),
                        ),
                        RangeSlider(
                          values: rangeValues,
                          activeColor: Colors.black,
                          inactiveColor: kDarkGrey.withOpacity(0.3),
                          onChanged: (newValue) {
                            setState(() {
                              rangeValues = newValue;
                              start = newValue.start.toInt().toString();
                              end = newValue.end.toInt().toString();
                            });
                          },
                          max: 1000,
                          min: 20,
                        ),
                        Container(
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(
                            " ${end == "" ? "1000" : end} \$",
                            style: TextStyle(color: Colors.white),)),
                        ),
                      ],),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Button(onPressed: () {
                        Navigator.pop(context);
                      }, text: "Apply Filter",),
                    ),


                  ],
                ),
              );
            },

          );
        });
  }

}



