import 'package:flutter/cupertino.dart';
import 'package:vrent/models/payout%20models/add_payment_method.dart';

class PaymentMethodProvider extends ChangeNotifier{

  String? paymentMethod;
  final bankNameController=TextEditingController();
  final accountHolderController=TextEditingController();
  final ibnController=TextEditingController();
  final swiftCodeController=TextEditingController();
  final branchNameController=TextEditingController();
  final branchAddressController=TextEditingController();
  final branchCityController=TextEditingController();
  final countryController=TextEditingController();
  final paypalEmailIdController=TextEditingController();


  List paymentMethodList=[];


}