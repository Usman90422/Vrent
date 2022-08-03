import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/models/payout%20models/add_payment_method.dart';
import 'package:vrent/providers/add_payment_method.dart';
import 'package:vrent/widgets/backwithtext.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/mybutton.dart';
import 'package:vrent/widgets/mytextfield.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({Key? key}) : super(key: key);

  @override
  _AddPaymentMethodState createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {


  String? selectedPaymentMethod;
  List paymentMethods=["Bank","Paypal"];

List<PaymentMethodProvider> form=[];
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<PaymentMethodProvider>(context);
    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackWithText(title: "Add payment method",),
                const Divider(color: kDarkGrey,height: 5,thickness: 2,),
                const SizedBox(height: 20),
                const Heading(title: "Select a payment Method",
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff3A3A3C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButton(
                          isExpanded: true,
                          hint: const Text(
                            "Payment Method",
                            style: TextStyle(color: Colors.white60),
                          ),
                          dropdownColor: const Color(0xff3A3A3C),
                          value: selectedPaymentMethod,
                          onChanged: (newVal) {
                            setState(() {
                              selectedPaymentMethod =
                              newVal as String?;
                            });
                          },
                          items: paymentMethods.map((ptype) {
                            return DropdownMenuItem(
                                value: ptype,
                                child: Text(
                                  ptype,
                                  style: const TextStyle(color: Colors.white),
                                ));
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                if(selectedPaymentMethod=="")
                  const Text(""),

                  if(selectedPaymentMethod=="Bank")
                     Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const SizedBox(height: 10),
                      const Heading(title: "Bank name"),
                      const SizedBox(height: 10),
                       MyTextField(hintText: "Enter the bank name",
                        controller: provider.bankNameController,
                      ),

                      const SizedBox(height: 10),
                      const Heading(title: "Bank account holder name"),
                      const SizedBox(height: 10),
                       MyTextField(hintText: "Enter a name",
                         controller: provider.accountHolderController,
                       ),

                      const SizedBox(height: 10),
                      const Heading(title: "Bank account number/Iban"),
                      const SizedBox(height: 10),
                      MyTextField(hintText: "Enter IBN number",
                        controller: provider.ibnController,
                      ),


                      const SizedBox(height: 10),
                      const Heading(title: "Swift Code"),
                      const SizedBox(height: 10),
                      MyTextField(hintText: "Enter Swift Code",
                        controller: provider.swiftCodeController,
                      ),


                      const SizedBox(height: 10),
                      const Heading(title: "Branch name"),
                      const SizedBox(height: 10),
                       MyTextField(hintText: "Enter the branch name",
                        controller: provider.branchNameController,
                      ),

                      const SizedBox(height: 10),
                      const Heading(title: "Branch city"),
                      const SizedBox(height: 10),
                       MyTextField(hintText: "Enter a city",
                         controller: provider.branchCityController,
                       ),

                      const SizedBox(height: 10),
                      const Heading(title: "Branch address"),
                      const SizedBox(height: 10),
                      MyTextField(hintText: "Enter an address",
                        controller: provider.branchAddressController,
                      ),

                      const SizedBox(height: 10),
                      const Heading(title: "Country"),
                      const SizedBox(height: 10),
                       MyTextField(hintText: "Enter your country's name",
                         controller: provider.countryController,
                       ),
                      const SizedBox(height: 20),

                      Center(child: Button(text: 'Add Method', onPressed: () {
                      },)),
                      const SizedBox(height: 20),

                    ],),

                if(selectedPaymentMethod=="Paypal")
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children:   [
                      const SizedBox(height: 10),
                      const Heading(title: "Paypal email id"),
                      const SizedBox(height: 10),
                      MyTextField(hintText: "Enter an email",
                        controller: provider.paypalEmailIdController,
                      ),
                        const SizedBox(height: 20),

                        Center(
                            child: Button(
                              text: 'Add Method', onPressed: () {
                                if(selectedPaymentMethod=="Bank")
                                  {

                                  }

                        },)),
                        const SizedBox(height: 20),

                      ],),


              ]),
        ),
      ),
    );
  }
}
