import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/models/property%20listing%20models/property_details.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/button_with_icon.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/mytextfield.dart';

class Page7 extends StatefulWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  _Page7State createState() => _Page7State();
}

final propertyDetails=PropertyDetails();

class _Page7State extends State<Page7> {
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
                child: BoldHeading(title: 'Base Price')),
            const SizedBox(height: 20),

            const Heading(title: "Nightly Price"),
            const SizedBox(height: 20),
            const MyTextField(hintText: "Enter a price",inputType: TextInputType.number,),
            const SizedBox(height: 20),


            const Heading(title: "Currency"),
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
                          "Select a currency",
                          style: TextStyle(color: Colors.white60),
                        ),
                        dropdownColor: Color(0xff3A3A3C),
                        value: propertyDetails.selectedCurrency,
                        onChanged: (newVal) {
                          setState(() {
                            propertyDetails.selectedCurrency =
                            newVal as String?;
                          });
                        },
                        items: propertyDetails.currencies.map((ctype) {
                          return DropdownMenuItem(
                              value: ctype,
                              child: Text(
                                ctype,
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

            const Line(),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: BoldHeading(title: "Booking"),
            ),
            const SizedBox(height: 20),
            const Heading(title: "Choose how your guests book."),
            const SizedBox(height: 20),
            const Heading(title: "Booking style"),
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
                          "Select type",
                          style: TextStyle(color: Colors.white60),
                        ),
                        dropdownColor: Color(0xff3A3A3C),
                        value: propertyDetails.selectedBookingType,
                        onChanged: (newVal) {
                          setState(() {
                            propertyDetails.selectedBookingType =
                            newVal as String?;
                          });
                        },
                        items: propertyDetails.bookingType.map((booktype) {
                          return DropdownMenuItem(
                              value: booktype,
                              child: Text(
                                booktype,
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
                      goToPage: 5,
                      Width: size.width*0.4,
                      color: Colors.red,
                      icon:  const Icon(Icons.arrow_back_sharp,color: Colors.white,)),
                  ButtonWithIcon(
                      isBack:false,
                      text: 'Next',
                      goToPage: 7,
                      Width: size.width*0.4,
                      color: kButtonColor,
                      icon:  const Icon(Icons.arrow_forward,color: Colors.white,)),

                ],),
            ),
          ],
        ));
  }
}
