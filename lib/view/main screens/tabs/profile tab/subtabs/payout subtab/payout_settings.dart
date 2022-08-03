import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/models/payout%20models/add_payment_method.dart';
import 'package:vrent/providers/add_payment_method.dart';
import 'package:vrent/view/main%20screens/tabs/profile%20tab/subtabs/payout%20subtab/add_payment_method.dart';
import 'package:vrent/widgets/backwithtext.dart';

class PayoutSettings extends StatefulWidget {
  const PayoutSettings({Key? key}) : super(key: key);

  @override
  _PayoutSettingsState createState() => _PayoutSettingsState();
}

List<PaymentMethod> paymentMethodForm= [];
int globalIndex=0;
//
// final paymentMethodProvider=PaymentMethodProvider();
// void deleteItem(index) {
//   paymentMethodProvider.paymentMethodList.remove(index);
// }


class _PayoutSettingsState extends State<PayoutSettings> {
  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<PaymentMethodProvider>(context);
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackWithText(title: "Payout Settings",),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddPaymentMethod()));
                      },
                          icon: const Icon(Icons.add,color: Colors.white,)),
                    )
                  ],
                ),
                const Divider(color: kDarkGrey,height: 5,thickness: 2,),

                SizedBox(
                  width: size.width*0.9,
                  height: size.height*0.8,
                  child: ListView.builder(
                    itemCount:1,
                    itemBuilder: (context,index) {
                      return Card(index,context);
                    },
                  ),
                )

              ]),
        ),
      ),
    );
  }
  Widget Card(int index,BuildContext context)
  {
    var size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        height: size.height*0.47,
        decoration:  BoxDecoration(
          color: kDarkGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children:  [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                  width:50,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kButtonColor
                      ),
                      child: const Image(image: AssetImage("images/debit_white.png"),))),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Divider(color: Colors.white,),
            ),
            const Text('Payment Method',style: TextStyle(color: kButtonColor,fontSize: 20),),
            const Text('PayPal',style: TextStyle(color: Colors.white,fontSize: 15),),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Divider(color: Colors.white,),
            ),

            const Text('Account',style: TextStyle(color: kButtonColor,fontSize: 20),),
            const Text('Usman ',style: TextStyle(color: Colors.white,fontSize: 15),),
            const Text('usman99@gmail.com',style: TextStyle(color: Colors.white,fontSize: 15),),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Divider(color: Colors.white,),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: kButtonColor)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.red)),
              ],),
          ],
        ),
      ),
    );

  }
}
