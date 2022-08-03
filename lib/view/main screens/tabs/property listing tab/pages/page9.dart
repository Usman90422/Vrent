import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/button_with_icon.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/mytextfield.dart';

import '../property_listing_tab.dart';

class Page9 extends StatefulWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  _Page9State createState() => _Page9State();
}

class _Page9State extends State<Page9> {

  final dateformate = DateFormat('dd-MM-yyyy');

  File? csvFile;

  late String startDate='';
  late String endDate='';

  DateRangePickerController dateRangePickerController = DateRangePickerController();
  TextEditingController priceController=TextEditingController();
  TextEditingController minStayController=TextEditingController();


  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      startDate =dateformate.format(args.value.startDate).toString();
      endDate =dateformate.format(args.value.endDate ?? args.value.startDate).toString();
    });
  }


  Future uploadCsv() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv','xlsx','ods','pdf','tsv'],
    );
    if (result != null) {
      csvFile = File(result.files.single.path!);

    }
    setState(() {});
  }
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        //Title
        const Center(child: BoldHeading(title: 'List your space')),

        const Line(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading(title: 'Select a start and end date and set a price for those dates ',),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child:  SfDateRangePicker(
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
              ),

              // Text(startDate=="" ? "no start" : startDate,style: const TextStyle(color: Colors.white)),
              // // Padding(
              // //   padding:
              // //       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // //   child: GestureDetector(
              // //     onTap: () {
              // //       showDatePicker(
              // //         builder: (context, child) {
              // //           return Theme(
              // //             data: Theme.of(context).copyWith(
              // //               colorScheme: const ColorScheme.light(
              // //                 primary: kButtonColor,
              // //                 // header background color
              // //                 onPrimary: Colors.white,
              // //                 // header text color
              // //                 onSurface: Colors.black, // body text color
              // //               ),
              // //               textButtonTheme: TextButtonThemeData(
              // //                 style: TextButton.styleFrom(
              // //                   primary: Colors.black, // button text color
              // //                 ),
              // //               ),
              // //             ),
              // //             child: child!,
              // //           );
              // //         },
              // //         context: context,
              // //         initialDate: DateTime.now(),
              // //         firstDate: DateTime(2000),
              // //         lastDate: DateTime(2040),
              // //       ).then((sd) {
              // //         setState(() {
              // //           startDate = sd;
              // //         });
              // //       });
              // //     },
              // //     child: Container(
              // //       width: size.width,
              // //       height: 50,
              // //       decoration: BoxDecoration(
              // //         color: const Color(0xff3A3A3C),
              // //         borderRadius: BorderRadius.circular(12),
              // //       ),
              // //       child: Padding(
              // //         padding: const EdgeInsets.symmetric(horizontal: 20),
              // //         child: Row(
              // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // //           children: [
              // //             Text(
              // //               startDate == null
              // //                   ? "dd/mm/yy"
              // //                   : dateformate.format(startDate!),
              // //               style: const TextStyle(
              // //                   fontSize: 15.0, color: Colors.white60),
              // //             ),
              // //             const Icon(
              // //               Icons.calendar_today,
              // //               color: kButtonColor,
              // //             ),
              // //           ],
              // //         ),
              // //       ),
              // //     ),
              // //   ),
              // // ),
              // const Heading(title: 'End Date'),
              // Text(endDate=="" ? "no end" : endDate,style: const TextStyle(color: Colors.white),),

              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   child: GestureDetector(
              //     onTap: () {
              //       showDatePicker(
              //         builder: (context, child) {
              //           return Theme(
              //             data: Theme.of(context).copyWith(
              //               colorScheme: const ColorScheme.light(
              //                 primary: kButtonColor,
              //                 // header background color
              //                 onPrimary: Colors.white,
              //                 // header text color
              //                 onSurface: Colors.black, // body text color
              //               ),
              //               textButtonTheme: TextButtonThemeData(
              //                 style: TextButton.styleFrom(
              //                   primary: Colors.black, // button text color
              //                 ),
              //               ),
              //             ),
              //             child: child!,
              //           );
              //         },
              //         context: context,
              //         initialDate: DateTime.now(),
              //         firstDate: DateTime(2000),
              //         lastDate: DateTime(2040),
              //       ).then((ed) {
              //         setState(() {
              //           endDate = ed;
              //         });
              //       });
              //     },
              //     child: Container(
              //       width: size.width,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         color: const Color(0xff3A3A3C),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               endDate == null
              //                   ? "dd/mm/yy"
              //                   : dateformate.format(endDate!),
              //               style: const TextStyle(
              //                   fontSize: 15.0, color: Colors.white60),
              //             ),
              //             const Icon(
              //               Icons.calendar_today,
              //               color: kButtonColor,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const Heading(title: 'Price'),
              const SizedBox(height: 10),
               MyTextField(
                controller: priceController,
                hintText: "Enter a price",
                inputType: TextInputType.number,
                 onChanged: (val){
                  setState(() {
                    val=priceController.text;
                  });
                 },
              ),
              const SizedBox(height: 10),

              if(startDate!="" && endDate!="" && priceController.text!="" && startDate!=endDate)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("From ${startDate=="" ? "" : startDate} to ${endDate=="" ? "" : endDate}, Price will be ${priceController.text} \$ ",
                  style: const TextStyle(color: Colors.white),),
              ),

              if(startDate!="" && endDate!="" && priceController.text!="" && startDate==endDate)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("On ${startDate=="" ? "" : startDate}, Price will be ${priceController.text} \$ ",
                    style: const TextStyle(color: Colors.white),),
                ),

              const SizedBox(height: 10),
              const Heading(title: 'Minimum Stay'),
              const SizedBox(height: 10),
              MyTextField(
                controller: minStayController,
                hintText: "Enter a number",
                inputType: TextInputType.number,
                onChanged: (val){
                  setState(() {
                    val=minStayController.text;
                  });
                },
              ),

              const SizedBox(height: 10),
              const Heading(title: 'Status'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            "Select a status",
                            style: TextStyle(color: Colors.white60),
                          ),
                          dropdownColor: const Color(0xff3A3A3C),
                          value: propertyDetails.selectedStatus,
                          onChanged: (newVal) {
                            setState(() {
                              propertyDetails.selectedStatus =
                                  newVal as String?;
                            });
                          },
                          items: propertyDetails.statusType.map((statusType) {
                            return DropdownMenuItem(
                                value: statusType,
                                child: Text(
                                  statusType,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        uploadCsv();
                      },
                      child: const Text("Upload CSV"),
                      style: ElevatedButton.styleFrom(
                          primary: kButtonColor,
                          fixedSize: const Size(130, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          startDate = "";
                          endDate = "";
                          priceController.text="";
                          minStayController.text="";
                        });
                      },
                      child: const Text("Clear"),
                      style: ElevatedButton.styleFrom(
                          primary: kButtonColor,
                          fixedSize: const Size(130, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        const Line(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWithIcon(
                  isBack: true,
                  text: 'Back',
                  goToPage: 7,
                  Width: size.width * 0.4,
                  color: Colors.red,
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  )),
              ButtonWithIcon(
                  isBack: false,
                  text: 'Submit',
                  goToPage: 9,
                  Width: size.width * 0.4,
                  color: kButtonColor,
                  icon: const Icon(
                    Icons.done,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ],
    ));
  }



  // Widget cellBuilder(
  //     BuildContext context, DateRangePickerCellDetails cellDetails) {
  //     if (dateRangePickerController.view == DateRangePickerView.month) {
  //       return Column(
  //         children: [
  //           Text(DateFormat('dd').format(cellDetails.date),style: TextStyle(fontSize: 10),),
  //               Text("\$",style: TextStyle(fontSize: 8),),
  //
  //         ],
  //       );
  //     }
  //     else if (dateRangePickerController.view == DateRangePickerView.year) {
  //     return  Center(child: Text(DateFormat('MMM').format(cellDetails.date)));
  //   }
  //     else if (dateRangePickerController.view == DateRangePickerView.decade) {
  //     return Center(child: Text(DateFormat('yyy').format(cellDetails.date)));
  //   }
  //     else {
  //     final int yearValue = cellDetails.date.year;
  //     return Center(child: Text(yearValue.toString() + ' - ' + (yearValue + 9).toString()));
  //   }
  // }
}
