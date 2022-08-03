import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/location_text.dart';
import 'package:vrent/widgets/mybutton.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  DateTime? checkInDate;
  DateTime? checkOutDate;
  final dateformate = DateFormat('dd / MM /yyyy');


  String? numOfGuests;
  List numOfGuest=["1 Guest","3 Guests","5 Guests","10 Guests","15+ Guests"];

  DateRangePickerController dateRangePickerController = DateRangePickerController();

  late String startDate='';
  late String endDate='';
  late String guests="";

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      startDate =dateformate.format(args.value.startDate).toString();
      endDate =dateformate.format(args.value.endDate ?? args.value.startDate).toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BackWithText(title: "Request to Book"),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         width: 150,
                         child: ClipRRect(
                           borderRadius:  BorderRadius.circular(20),
                           child: const Image(image: AssetImage("images/1.jpg")),
                         ),
                       ),

                       SizedBox(
                         width: 150,
                         child: Column(
                           children: const [
                             Text("Luxury Resort Room",
                               style: TextStyle(color: Colors.white,
                                 overflow: TextOverflow.clip,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 20,
                               ),
                             ),
                             SizedBox(height: 20,),
                             LocationText(title: "Bali Island",Width: 100.0,),
                           ],
                         ),
                       ),
                     ],),
                   const Line(),
                   const BoldHeading(title: "Your Trip"),
                   const SizedBox(height: 10),
                   const Text("Dates", style: TextStyle(color: kPrimaryColor,fontSize: 15,fontWeight: FontWeight.bold)),
                   const SizedBox(height: 10),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:  [
                      const Text("01-01-2021 to 02-02-2021 ", style: TextStyle(color: kPrimaryColor,fontSize: 15)),
                       // Text(startDate + " to " + endDate, style: TextStyle(color: kPrimaryColor,fontSize: 15)),
                       GestureDetector(onTap: (){
                         setState(() {
                           DateRangeBottomSheet(context);
                         });
                       },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text("Edit",
                              style: TextStyle(color: kButtonColor,
                                  fontSize: 15,
                                  decorationStyle: TextDecorationStyle.double,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline
                              ),),
                        ),
                       ),
                   ],),
                   const SizedBox(height: 20),
                   const Text("Guests", style: TextStyle(color: kPrimaryColor,fontSize: 15,fontWeight: FontWeight.bold)),
                   const SizedBox(height: 10),
                   Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:  [
                           Text(guests==""?"1 guest":guests, style: TextStyle(color: kPrimaryColor,fontSize: 15)),
                           GestureDetector(onTap: (){
                                  GuestsBottomSheet(context);
                           },
                             child: const Padding(
                               padding: EdgeInsets.only(right: 20),
                               child: Text("Edit",
                                 style: TextStyle(color: kButtonColor,
                                     fontSize: 15,
                                     decorationStyle: TextDecorationStyle.double,
                                     fontWeight: FontWeight.bold,
                                     decoration: TextDecoration.underline
                                 ),),
                             ),
                           ),
                         ],),
                   const Line(),
                   const BoldHeading(title: "Price Details"),
                   const SizedBox(height: 10),
                     Padding(
                       padding: const EdgeInsets.only(right: 20),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: const[
                            Text("\$30 x 2 nights", style: TextStyle(color: kPrimaryColor,fontSize: 15)),
                            SizedBox(height: 10),
                            Text("Cleaning fee", style: TextStyle(color: kPrimaryColor,fontSize: 15)),
                           SizedBox(height: 10),
                           Text("Total", style: TextStyle(color: kPrimaryColor,fontSize: 15,fontWeight: FontWeight.bold)),
                         ]),
                         Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: const[
                            Text("\$60", style: TextStyle(color: kPrimaryColor,fontSize: 15)),
                           SizedBox(height: 10),
                           Text("\$100", style: TextStyle(color: kPrimaryColor,fontSize: 15)),
                           SizedBox(height: 10),
                           Text("\$160", style: TextStyle(color: kPrimaryColor,fontSize: 15,fontWeight: FontWeight.bold)),


                         ]),
                       ],),
                     ),
                     const Line(),
                     Center(
                       child: ElevatedButton(onPressed: () {
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ConfirmBooking()));
                       },
                         style: ElevatedButton.styleFrom(
                             primary: kButtonColor,
                             fixedSize: const Size(200, 50),
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                         child: const Text("Confirm Booking"),

                       ),
                     ),
                 ]),
               ),

            ],
          ),
        ),
      ),
    );
  }


  DateRangeBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext c) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const BoldHeading(title: "Edit Date",color: Colors.black,),
                    const SizedBox(height: 20),
                    SfDateRangePicker(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      todayHighlightColor: kButtonColor,
                      selectionMode: DateRangePickerSelectionMode.range,
                      startRangeSelectionColor: kButtonColor,
                      endRangeSelectionColor:  kButtonColor,
                      controller: dateRangePickerController,
                      onSelectionChanged: onSelectionChanged,
                      rangeSelectionColor: kButtonColor.withOpacity(0.2),
                      enablePastDates: false,
                      headerStyle: const DateRangePickerHeaderStyle(
                          backgroundColor: kDarkGrey,
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white,
                          )),
                      monthViewSettings: const DateRangePickerMonthViewSettings(
                          viewHeaderStyle: DateRangePickerViewHeaderStyle(
                              backgroundColor: Colors.black,
                              textStyle: TextStyle(fontSize: 14, color: Colors.white))),
                    ),
                    Button(onPressed: () {
                      Navigator.pop(context);
                      print(startDate);
                    }, text: 'Save',),
                  ],
                ),
              );
            },

          );
        });
  }

  GuestsBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext con) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child:   Column(
                  children: [
                    const SizedBox(height: 10),
                    const BoldHeading(title: "Edit Guests",color: Colors.black,),
                    const SizedBox(height: 20),
                    const BoldHeading(title: 'Select number Of guests',color: Colors.black,),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff3A3A3C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButton(
                              isExpanded: true,
                              hint: const Text("Select a plan",style: TextStyle(color: Colors.white60),),
                              dropdownColor: const Color(0xff3A3A3C),
                              value: numOfGuests,
                              onChanged: (newVal){
                                setState(() {
                                  numOfGuests= newVal as String?;
                                  guests=numOfGuests!;
                                });
                              },
                              items: numOfGuest.map((plan){
                                return DropdownMenuItem(
                                    value: plan,
                                    child: Text(plan,style: const TextStyle(color: Colors.white60),));
                              }).toList(),
                            ),
                          ),),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(onPressed: () {
                      Navigator.pop(context);
                    }, text: 'Save',),
                  ],
                ),
              );
            },

          );
        });
  }


}


