import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/controller/login_user.dart';
import 'package:vrent/controller/register_user.dart';
import 'package:vrent/view/login/login_screen.dart';
import 'package:vrent/widgets/dialogs/dialogs.dart';
import 'package:vrent/widgets/mybutton.dart';
import 'package:vrent/widgets/mytextfield.dart';
import 'package:vrent/widgets/password_textfield.dart';
import 'package:vrent/widgets/short_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {



  final users=LoginUser();
  final registerUser=RegisterUser();
  final dialogs=Dialogs();

  var code;
  String countryCode="";
  String phoneNumber='';
  String country="";
  bool notSame=false;
  bool loading=false;
  // String dob="";

  void isLoading(bool val)
  {
    setState(() {
      loading=val;
    });
  }

  final firstNameController= TextEditingController();
  final lastNameController= TextEditingController();
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  final confirmPasswordController= TextEditingController();
  final numberController= TextEditingController();

  // final monthController= TextEditingController();
  // final dateController= TextEditingController();
  // final yearController= TextEditingController();

   late Map userDetail;

  // late String monthString="";
  // late String dateString="";
  // late String yearString="";
  //
  // int month=0;
  //  int date=0;
  //  int year=0;

  void clearFields(){
    firstNameController.text="";
    lastNameController.text="";
    emailController.text="";
    passwordController.text="";
    confirmPasswordController.text="";
    numberController.text="";
    // dateController.text="";
    // monthController.text="";
    // yearController.text="";
    // dob="";
    phoneNumber="";
    countryCode="";
  }

  // void clearDobFields(){
  //   dateController.text="";
  //   monthController.text="";
  //   yearController.text="";
  //   date=0;
  //   month=0;
  //   year=0;
  // }


  // void showToast3() {
  //   Fluttertoast.showToast(
  //     msg: 'wrong date of birth',
  //     toastLength: Toast.LENGTH_LONG,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 3,
  //     backgroundColor: Colors.black.withOpacity(0.5),
  //     textColor: Colors.white,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 40, top: 60, right: 40, bottom: 20),
                    child: Image(image: AssetImage("images/vrent_logo.png")),
                  ),
                  const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: kButtonColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                  MyTextField(
                    controller: firstNameController,
                    hintText: "First Name",
                    inputType: TextInputType.name,
                  ),

                  const SizedBox(height: 20),
                  MyTextField(
                    controller: lastNameController,
                    hintText: "Last Name",
                    inputType: TextInputType.name,
                  ),

                  const SizedBox(height: 20),
                  MyTextField(
                    controller: emailController,
                    hintText: "Email",
                    inputType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 20),
                   PasswordTextField(
                    controller: passwordController,
                    hintText: "Password",
                  ),

                  const SizedBox(height: 20),
                  PasswordTextField(
                    onChanged: (val)
                    {
                      if(val!=passwordController.text)
                      {
                        setState(() {
                          notSame=true;
                        });
                      }
                      else
                      {
                        setState(() {
                          notSame=false;
                        });
                      }
                    },
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                  ),
                  notSame==true ?
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                    child: Text("passwords do not match",style: TextStyle(color: Colors.red),),
                  ) :  const Text(""),


                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
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
                            initialSelection: 'Australia',
                            textStyle: const TextStyle(color: Colors.white),
                            onChanged: (cd) {
                              country=cd.name.toString();
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


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button(
                          text: "Register",
                          onPressed: () async{
                           String response=await users.emailCheck(emailController.text);
                           if(response=="!found")
                             {
                               if(firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty && emailController.text.isNotEmpty &&
                                   passwordController.text.isNotEmpty && numberController.text.isNotEmpty ) //dateController.text.isNotEmpty && monthController.text.isNotEmpty &&
                                 // yearController.text.isNotEmpty
                                   {

                                 phoneNumber =  countryCode + "-" + numberController.text ;
                                 // dob = dateController.text + "/" + monthController.text +"/" + yearController.text;
                                 // if( date<=31 &&  month<=12 && year<2050)
                                 //    {

                                 userDetail = {
                                   "first_Name": firstNameController.text,
                                   "last_Name": lastNameController.text,
                                   "email": emailController.text,
                                   "password": passwordController.text,
                                   "formatted_phone": phoneNumber,
                                   "phone": numberController.text,
                                   "carrier_code" : countryCode,
                                   "default_country": country,
                                   //  "dob": dob,
                                 };
                                 if(countryCode.isNotEmpty && country.isNotEmpty)
                                   {
                                     if(confirmPasswordController.text==passwordController.text){
                                       isLoading(true);
                                       await registerUser.register(userDetail);
                                       isLoading(false);
                                       await dialogs.SuccessDialog(context);
                                       clearFields();
                                       // clearDobFields();
                                       code=null;
                                       Navigator.pop(context);
                                       // }
                                       // else
                                       // {
                                       //   showToast2();
                                       //   // clearDobFields();
                                       // }
                                     }
                                     else{dialogs.showToast("Passwords do not match");}

                                   }
                                 else{
                                   dialogs.showToast("Please select a country");
                               }
                               }
                               else
                               {
                                dialogs.fillAllFieldsToast();
                               }
                             }
                          else {
                             dialogs.showToast("Email already exists");
                           }

                         },
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            loading==true ? Container(
              height: size.height,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator(
                color: kButtonColor,
              ),),
            ): const SizedBox(),
          ],
        ),
      ),
    );
  }
}


//
// Button(
// text: "Register",
// onPressed: () async{
// String response = await users.emailCheck(emailController.text);
// if(response=="!available")
// {
// // showToast2();
// print("email already exist");
// }
//
//
// if(firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty && emailController.text.isNotEmpty &&
// passwordController.text.isNotEmpty && numberController.text.isNotEmpty  ) //dateController.text.isNotEmpty && monthController.text.isNotEmpty &&
// // yearController.text.isNotEmpty
//     {
//
// phoneNumber = code==null ? "+61-" + numberController.text : countryCode +"-"+ numberController.text;
// // dob = dateController.text + "/" + monthController.text +"/" + yearController.text;
// // if( date<=31 &&  month<=12 && year<2050)
// //    {
//
// userDetail = {
// "first_Name": firstNameController.text,
// "last_Name": lastNameController.text,
// "email": emailController.text,
// "password": passwordController.text,
// "formatted_phone": phoneNumber,
// "phone": numberController.text,
// "carrier_code" : countryCode,
// "default_country": country,
// //  "dob": dob,
// };
// await registerUser.register(userDetail);
// await dialogs.SuccessDialog(context);
// clearFields();
// // clearDobFields();
// code=null;
// Navigator.pop(context);
// // }
// // else
// // {
// //   showToast2();
// //   // clearDobFields();
// // }
// }
// else
// {
// showToast();
// }
// },
// ),
