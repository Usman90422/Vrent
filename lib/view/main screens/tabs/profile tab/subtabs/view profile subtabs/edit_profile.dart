import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/controller/user_details.dart';
import 'package:vrent/providers/autocomplete.dart';
import 'package:vrent/view/main%20screens/tabs/property%20listing%20tab/pages/page1.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/mybutton.dart';
import 'package:vrent/widgets/mytextfield.dart';
import 'package:vrent/widgets/password_textfield.dart';
import 'package:vrent/widgets/short_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {


  var code;
  String countryCode="";
  String dob="";
  String phoneNumber='';
  String? selectedGender;

  List genders=["Male","Female","Other"];

  final firstNameController= TextEditingController();
  final lastNameController= TextEditingController();
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  final numberController= TextEditingController();
  final monthController= TextEditingController();
  final dateController= TextEditingController();
  final yearController= TextEditingController();
  final addressController= TextEditingController();

  late String monthString="";
  late String dateString="";
  late String yearString="";

  int month=0;
  int date=0;
  int year=0;

  void clearDobFields(){
    dateController.text="";
    monthController.text="";
    yearController.text="";
    date=0;
    month=0;
    year=0;
  }

  void showToast2() {
    Fluttertoast.showToast(
      msg: 'wrong date of birth',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.black.withOpacity(0.5),
      textColor: Colors.white,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    final autoCompletePlaces= Provider.of<AutoCompletePlaces>(context);
    final userDetails= Provider.of<UserDetails>(context);
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             BackWithText(title: "Edit Profile",),
              const Divider(color: kDarkGrey,height: 5,thickness: 2,),

              const SizedBox(height: 20),
              const Heading(title: "First Name",),
              const SizedBox(height: 10),
              MyTextField(
                controller: firstNameController,
                hintText: "First Name",
                inputType: TextInputType.name,
              ),

              const SizedBox(height: 20),
              const Heading(title: "Last Name",),
              const SizedBox(height: 10),
              MyTextField(
                controller: lastNameController,
                hintText: "Last Name",
                inputType: TextInputType.name,
              ),

              const SizedBox(height: 20),
              const Heading(title: "Email Address",),
              const SizedBox(height: 10),
              MyTextField(
                controller: emailController,
                hintText: "Email Address",
                inputType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),
              const Heading(title: "Gender",),
              const SizedBox(height: 10),
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
                        hint: const Text("Gender",style: TextStyle(color: Colors.white),),
                        dropdownColor: const Color(0xff3A3A3C),
                        value: selectedGender,
                        onChanged: (newVal){
                          setState(() {
                            selectedGender= newVal as String?;
                          });
                        },
                        items: genders.map((gender){
                          return DropdownMenuItem(
                              value: gender,
                              child: Text(gender,style: const TextStyle(color: Colors.white60),));
                        }).toList(),
                      ),
                    ),),
                ),
              ),

              const SizedBox(height: 20),
              const Heading(title: "Address",),
              const SizedBox(height: 20),
              MyTextField(hintText: "Enter an address",controller: addressController ,onChanged: (city){
                autoCompletePlaces.search(city);
              },),
              //Phone number
              Stack(children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Heading(title: "Phone Number",),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff3A3A3C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CountryCodePicker(
                              initialSelection: 'AU',
                              textStyle: const TextStyle(color: Colors.white),
                              onChanged: (cd) {
                                code = cd;
                                countryCode=code.toString();

                              },
                            ),
                          ),
                          Container(
                            width: size.width * 0.5,
                            decoration: BoxDecoration(
                              color: const Color(0xff3A3A3C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: MyTextField(
                              controller: numberController,
                              inputType: TextInputType.number,
                              hintText: "Number",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  child:Column(children: [
                    if(autoCompletePlaces.searchResults!=null
                        && autoCompletePlaces.searchResults!.isNotEmpty
                        && addressController.text.isNotEmpty ) //&& pickUpAddressFilled=false
                      Container(
                        margin: const  EdgeInsets.symmetric(vertical: 2,horizontal: 20),
                        height: 178,
                        decoration: BoxDecoration(
                          color: kDarkGrey,
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

              //DOB
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child:  Text("Date Of Birth",style: TextStyle(color: Colors.white),)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Date
                    Container(
                        width: size.width*0.22,
                        height: 50,
                        decoration: BoxDecoration(
                          color:  const Color(0xff3A3A3C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ShortTextField(
                          onChanged: (d)
                          {
                            dateString=d;
                            date=int.parse(dateString);
                          },
                          maxLength: 2,
                          inputType: TextInputType.number,
                          controller: dateController,
                          hintText: "date",) ),

                    //Month
                    Container(
                        width: size.width*0.3,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff3A3A3C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ShortTextField(
                          onChanged: (m)
                          {
                            monthString=m;
                            month=int.parse(monthString);
                            print(month);
                          },
                          maxLength: 2,
                          inputType: TextInputType.number,
                          controller: monthController,
                          hintText: "Month",) ),


                    //Year
                    Container(
                        width: size.width*0.22,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff3A3A3C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ShortTextField(
                          onChanged: (y)
                          {
                            yearString=y;
                            year=int.parse(yearString);
                          },
                          maxLength: 4,
                          inputType: TextInputType.number,
                          controller: yearController,
                          hintText: "Year",)
                    ),
                  ],
                ),
              ),

              const Heading(title: "Description",),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(vertical:5,),
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xff3A3A3C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Tell about yourself...",
                      hintStyle: TextStyle(
                          fontSize: 15.0, color: Colors.white60),
                      border: InputBorder.none,
                      contentPadding:  EdgeInsets.only(left: 10),
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 20),

              //button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Button(text: 'Save',onPressed: (){},),
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}

// dob and number check
// if(firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty && emailController.text.isNotEmpty &&
// passwordController.text.isNotEmpty && numberController.text.isNotEmpty && dateController.text.isNotEmpty && monthController.text.isNotEmpty &&
// yearController.text.isNotEmpty)
// {
// if( date<=31 &&  month<=12 && year<2050)
// {
// phoneNumber = code==null ? "+61-" + numberController.text : countryCode +"-"+ numberController.text;
// dob = dateController.text + "/" + monthController.text +"/" + yearController.text;

