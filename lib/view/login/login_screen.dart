import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/controller/login_user.dart';
import 'package:vrent/view/main%20screens/main_menu.dart';
import 'package:vrent/view/main%20screens/tabs/explore%20tab/explore_tab.dart';
import 'package:vrent/view/signup/registration_screen.dart';
import 'package:vrent/widgets/dialogs/dialogs.dart';
import 'package:vrent/widgets/mytextfield.dart';
import 'package:vrent/widgets/password_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrent/widgets/mybutton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final passwordController = TextEditingController();
final emailController = TextEditingController();

final loginUser=LoginUser();
final dialogs=Dialogs();



bool loading=false;



class _LoginState extends State<Login> {

  void isLoading(bool val)
  {
      setState(() {
     loading=val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 40, top: 60, right: 40, bottom: 20),
                    child: Hero(
                        tag: "logo",
                        child: Image(image: AssetImage("images/vrent_logo.png"))),
                  ),
                  const Text(
                    "Welcome!",
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                  const Text(
                    "Login to Continue",
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MyTextField(
                    controller: emailController,
                    hintText: "Email",
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),

                  PasswordTextField(
                    hintText: "Password",
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 230,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                              builder: (context) => const RegistrationScreen()));
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(color: kButtonColor,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Button(
                        text: "Login",
                        onPressed: () async{
                          if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty)
                            {
                              isLoading(true);
                           String response = await loginUser.login(emailController.text,passwordController.text);
                           if(response=="found") {
                               isLoading(false);
                             SharedPreferences prefs = await SharedPreferences.getInstance();
                             prefs.setString('firstName', loginUser.firstName);
                               prefs.setString('lastName', loginUser.lastName);
                               prefs.setString('email', loginUser.emailAddress);
                               prefs.setString('phone', loginUser.phone);
                               prefs.setString('code', loginUser.carrierCode);
                               prefs.setString('country', loginUser.country);
                               prefs.setInt('id', loginUser.id);
                               prefs.setString('picUrl', loginUser.picUrl);

                               Navigator.pushReplacement(context,
                                 MaterialPageRoute(builder: (BuildContext ctx) => const MainMenu()));
                             emailController.text="";
                             passwordController.text="";
                           }
                           else
                             {
                              await dialogs.UserNotFoundDialog(context);
                              isLoading(false);
                             }

                            }
                          else
                            {
                             dialogs.fillAllFieldsToast();
                            }

                        },
                      ),
                    ],
                  ),
                ],
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
      ),
    );
  }
}
