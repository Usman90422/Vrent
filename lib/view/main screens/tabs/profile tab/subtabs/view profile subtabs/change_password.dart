import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/controller/login_user.dart';
import 'package:vrent/controller/user_details.dart';
import 'package:vrent/view/login/login_screen.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/dialogs/dialogs.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/mybutton.dart';
import 'package:vrent/widgets/mytextfield.dart';
import 'package:vrent/widgets/password_textfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final oldPasswordController=TextEditingController();
  final newPasswordController=TextEditingController();
  final confirmNewPasswordController=TextEditingController();

  final login=LoginUser();
  final dialogs=Dialogs();

  bool loading=false;
  bool notSame=false;


  void isLoading(bool val)
  {
    setState(() {
      loading=val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userDetials= Provider.of<UserDetails>(context);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackWithText(title: "Change password"),
                  const Divider(color: kDarkGrey,height: 5,thickness: 2,),

                  const SizedBox(height: 20),
                  const Heading(title: "Old password",),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: oldPasswordController,
                    hintText: "Enter your old password",
                    inputType: TextInputType.name,
                  ),

                  const SizedBox(height: 20),
                  const Heading(title: "New password",),
                  const SizedBox(height: 10),
                  PasswordTextField(
                   //  onChanged: (val){
                   // if(confirmNewPasswordController.text!=val)
                   //   {
                   //     setState(() {
                   //       notSame=true;
                   //     });
                   //   }
                   //  },
                    hintText: "Enter a new Password",
                    controller: newPasswordController,),

                  const SizedBox(height: 20),
                  const Heading(title: "Confirm password",),
                  const SizedBox(height: 10),
                  PasswordTextField(
                    onChanged: (val){
                      if(val!=newPasswordController.text)
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
                    hintText: "Enter updated password",
                    controller: confirmNewPasswordController,),
                  notSame==true ?
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                        child: Text("passwords do not match",style: TextStyle(color: Colors.red),),
                      )
                  :  const Text(""),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Button(
                        onPressed: () async {
                         userDetials.getPrefs();
                         if(oldPasswordController.text.isNotEmpty && newPasswordController.text.isNotEmpty
                             && confirmNewPasswordController.text.isNotEmpty)
                           {
                             if(oldPasswordController.text!=newPasswordController.text)
                             {
                               if(newPasswordController.text==confirmNewPasswordController.text){
                                 if(login.oldPassword!=newPasswordController.text)
                                 {
                                   isLoading(true);
                                   await  login.changePassword(userDetials.id, newPasswordController.text);
                                   newPasswordController.text="";
                                   oldPasswordController.text="";
                                   confirmNewPasswordController.text="";
                                   isLoading(false);
                                   dialogs.showToast("Password updated successfully!");
                                 }
                                 else{
                                   dialogs.showToast("Old password cannot be used as new password");}
                               }
                               else{dialogs.showToast("Passwords do not match");}

                             }
                             else {
                               dialogs.showToast("Old password cannot be used as new password");}
                           }
                         else {
                           dialogs.fillAllFieldsToast();}
                    },
                        text: "Update password"),
                  ),

                ],),
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
