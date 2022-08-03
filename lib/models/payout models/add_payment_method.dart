import 'package:flutter/cupertino.dart';

class PaymentMethod {

   String payMethod;
   String country;
   String bankAccountHolderName;
   String iban;
   String swiftCode;
   String bankName;
   String branchName;
   String branchCity;
   String branchAddress;
   String payPalEmail;

  PaymentMethod(
      {required this.payMethod,
      required this.country,
      required this.bankAccountHolderName,
      required this.iban,
      required this.swiftCode,
      required this.bankName,
      required this.branchName,
      required this.branchCity,
      required this.branchAddress,
      required this.payPalEmail,
      });

}