import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/button_with_icon.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/mybutton.dart';
import 'package:vrent/widgets/mytextfield.dart';

import '../property_listing_tab.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}


class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
            child: BoldHeading(title: 'Rooms And Beds')),
        const SizedBox(height: 20),

        const Heading(title: "Bedrooms"),
        const SizedBox(height: 20),
        const MyTextField(hintText: "Number of bedrooms "),


        const SizedBox(height: 20),
        const Heading(title: "Beds"),
        const SizedBox(height: 20),
        const MyTextField(hintText: "Number of beds "),


        const SizedBox(height: 20),
        const Heading(title: "Bathrooms"),
        const SizedBox(height: 20),
        const MyTextField(hintText: "Number of bathrooms "),


        const SizedBox(height: 20),
        const Heading(title: "Bed Type"),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff3A3A3C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: const Text(
                      "Select a type",
                      style: TextStyle(color: Colors.white60),
                    ),
                    dropdownColor: const Color(0xff3A3A3C),
                    value: propertyDetails.selectedBedType,
                    onChanged: (newVal) {
                      setState(() {
                        propertyDetails.selectedBedType =
                        newVal as String?;
                      });
                    },
                    items: propertyDetails.bedTypes.map((htype) {
                      return DropdownMenuItem(
                          value: htype,
                          child: Text(
                            htype,
                            style: const TextStyle(color: Colors.white),
                          ));
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),

      const Line(),

        const Padding(
            padding: EdgeInsets.only(left: 20),
            child: BoldHeading(title: 'Listings')),
        const SizedBox(height: 20),

        const Heading(title: "Property Type"),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff3A3A3C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: const Text(
                      "Select a home type",
                      style: TextStyle(color: Colors.white60),
                    ),
                    dropdownColor: const Color(0xff3A3A3C),
                    value: propertyDetails.selectedHomeType,
                    onChanged: (newVal) {
                      setState(() {
                        propertyDetails.selectedHomeType =
                        newVal as String?;
                      });
                    },
                    items: propertyDetails.homeType.map((htype) {
                      return DropdownMenuItem(
                          value: htype,
                          child: Text(
                            htype,
                            style: const TextStyle(color: Colors.white),
                          ));
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
        const Heading(title: "Room Type"),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff3A3A3C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: const Text(
                      "Select a room type",
                      style: TextStyle(color: Colors.white60),
                    ),
                    dropdownColor: Color(0xff3A3A3C),
                    value: propertyDetails.selectedRoomType,
                    onChanged: (newVal) {
                      setState(() {
                        propertyDetails.selectedRoomType =
                        newVal as String?;
                      });
                    },
                    items: propertyDetails.roomType.map((rtype) {
                      return DropdownMenuItem(
                          value: rtype,
                          child: Text(
                            rtype,
                            style: const TextStyle(color: Colors.white),
                          ));
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),


        const SizedBox(height: 20),
        const Heading(title: "Accommodates"),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff3A3A3C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: const Text(
                      "Select a number",
                      style: TextStyle(color: Colors.white60),
                    ),
                    dropdownColor: Color(0xff3A3A3C),
                    value: propertyDetails.selectedAccommodates,
                    onChanged: (newVal) {
                      setState(() {
                        propertyDetails.selectedAccommodates =
                        newVal as String?;
                      });
                    },
                    items: propertyDetails.accommodates.map((accom) {
                      return DropdownMenuItem(
                          value: accom,
                          child: Text(
                            accom,
                            style: const TextStyle(color: Colors.white),
                          ));
                    }).toList(),
                  ),
                ),
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
              goToPage: 0,
              Width: size.width*0.4,
              color: Colors.red,
              icon:  const Icon(Icons.arrow_back_sharp,color: Colors.white,)),
              ButtonWithIcon(
                  isBack:false,
                  text: 'Next',
                  goToPage: 2,
                  Width: size.width*0.4,
                  color: kButtonColor,
                  icon:  const Icon(Icons.arrow_forward,color: Colors.white,)),

          ],),
        ),


      ],
    ));
  }
}
