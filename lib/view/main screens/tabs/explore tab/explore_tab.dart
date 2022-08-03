import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/controller/autocomplete_places.dart';
import 'package:vrent/controller/login_user.dart';
import 'package:vrent/providers/autocomplete.dart';
import 'package:vrent/view/main%20screens/tabs/explore%20tab/explore_subScreens/searched_locations.dart';
import 'package:vrent/widgets/mytextfield.dart';
import 'package:intl/intl.dart';

import '../../../login/login_screen.dart';


class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}


class _ExploreState extends State<Explore> {

  DateTime? checkInDate;
  DateTime? checkOutDate;
  final dateformate = DateFormat('dd-MM-yyyy');


  String? selectedPlan;
  List plans=["1 Guest","3 Guests","5 Guests","10 Guests","15+ Guests"];

  bool addressFilled=false;

  final addressController=TextEditingController();
  final autoCompletePlaces=AutoCompletePlaces();
  final loginUser=LoginUser();


  final auto=PlacesAutoComplete();

  // var username;


 String location="";

  // void getUserName() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     username=prefs.get('username');
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    final autoCompletePlaces= Provider.of<AutoCompletePlaces>(context);


    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [

            Container(
              width:size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/bg.png"),
                ),
              ),
            ),
            // Image(image: AssetImage("images/bg.png"),),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Header
                  // const Padding(
                  //     padding:
                  //         EdgeInsets.only(left: 120, top: 20, right: 120, bottom: 20),
                  //     child: Hero(
                  //         tag: "logo",child: Image(image: AssetImage("images/vrent_logo.png"))),
                  //   ),

                  //Title
                  const Center(
                    child: Text(
                      "Make Your Reservation",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 40),

                  MyTextField(hintText: "Where do you want to go?",controller: addressController ,onChanged: (d){
                    autoCompletePlaces.search(d);
                  },),

                  Stack(children: [
                    //Calender
                    Column(
                      children: [
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: kButtonColor,
                                            // header background color
                                            onPrimary: Colors.white,
                                            // header text color
                                            onSurface: Colors.black, // body text color
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary: Colors.black, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2040),
                                  ).then((cid) {
                                    setState(() {
                                      checkInDate = cid;
                                    });
                                  });
                                },
                                child: Container(
                                  width: size.width * 0.4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3A3A3C),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        checkInDate == null
                                            ? "Check In"
                                            : dateformate.format(checkInDate!),
                                        style: const TextStyle(
                                            fontSize: 15.0, color: Colors.white60),
                                      ),
                                      const Icon(
                                        Icons.calendar_today,
                                        color: kButtonColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: kButtonColor,
                                            // header background color
                                            onPrimary: Colors.white,
                                            // header text color
                                            onSurface: Colors.black, // body text color
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary: Colors.black, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2040),
                                  ).then((cod) {
                                    setState(() {
                                      checkOutDate = cod;
                                    });
                                  });
                                },
                                child: Container(
                                  width: size.width * 0.4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3A3A3C),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        checkOutDate == null
                                            ? "Check Out"
                                            : dateformate.format(checkOutDate!),
                                        style: const TextStyle(
                                            fontSize: 15.0, color: Colors.white60),
                                      ),
                                      const Icon(
                                        Icons.calendar_today,
                                        color: kButtonColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),

                        //Dropdown
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
                                  dropdownColor: Color(0xff3A3A3C),
                                  value: selectedPlan,
                                  onChanged: (newVal){
                                    setState(() {
                                      selectedPlan= newVal as String?;
                                    });
                                  },
                                  items: plans.map((plan){
                                    return DropdownMenuItem(
                                        value: plan,
                                        child: Text(plan,style: const TextStyle(color: Colors.white60),));
                                  }).toList(),
                                ),
                              ),),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                    Container(
                      child:Column(children: [
                        if(autoCompletePlaces.searchResults!=null
                            && autoCompletePlaces.searchResults!.isNotEmpty
                            && addressController.text.isNotEmpty ) //&& pickUpAddressFilled=false
                          Container(
                            margin: const  EdgeInsets.symmetric(vertical: 2,horizontal: 20),
                            height: 178,
                            decoration: BoxDecoration(
                              color: kDarkGrey ,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.builder(
                                itemCount: autoCompletePlaces.searchResults!.length,
                                itemBuilder: (context,index){
                                  return ListTile(
                                    title: Text(autoCompletePlaces.searchResults![index].description,
                                      style: const TextStyle(color: Colors.white),),
                                    onTap: (){
                                      addressController.text= autoCompletePlaces.searchResults![index].description;
                                      location=addressController.text;
                                      print(location);
                                      autoCompletePlaces.placeSelected(1);
                                      // pickUpAddressFilled=true;
                                      FocusScope.of(context).unfocus();
                                    },
                                  );
                                }),
                          ),
                      ],
                      ),
                    ),

                  ],),

                  //Button
                  GestureDetector(
                    onTap:(){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: size.width * 0.9,
                        height: 50,
                        decoration: BoxDecoration(
                          color:  kButtonColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Material(
                          borderRadius:BorderRadius.circular(12) ,
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: (){
                              if(addressController.text.isNotEmpty)
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>  SearchedLocations(location: location,)));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:const [
                                Text("Search",style: TextStyle(color: Colors.white,fontSize: 15),),
                                SizedBox(width: 2),
                                Icon(Icons.search,color: Colors.white,size: 20,),
                              ],
                            ),
                          ),
                        ),),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
