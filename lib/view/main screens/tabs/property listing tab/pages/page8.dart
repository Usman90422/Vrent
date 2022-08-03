import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/models/property%20listing%20models/additional_pricing_options.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/button_with_icon.dart';
import 'package:vrent/widgets/heading.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/mytextfield.dart';

class Page8 extends StatefulWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  _Page8State createState() => _Page8State();
}

List<AdditionalPricing> form = [];
int globalIndex=0;


void deleteItem(index) {
  form.remove(index);
}

class _Page8State extends State<Page8> {
  @override
  Widget build(BuildContext context) {
    final app= Provider.of<AdditionalPricing>(context);
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(height: 20),

            //Title
            const Center(
              child: BoldHeading(title: 'List your space'),
            ),

            const Line(),
             Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const BoldHeading(title: 'Additional Pricing Option'),
                    IconButton(onPressed: (){
                      setState(() {
                        if(app.iconImage!=null)
                          {
                            app.iconImage=null;
                            app.fileName="";
                          }
                       form.add(AdditionalPricing());
                      });
                    }, icon: Container(
                        color: kButtonColor,
                        child: const Icon(Icons.add,color: Colors.white,))),
                  ],
                )),
            const SizedBox(height: 20),

            form.isEmpty
                ? const Center(child: Text("Add additional pricing options if you want to",style: TextStyle(color: Colors.white),))
                : Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ]),
              child: SizedBox(
                height: 400,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: form.length,
                    itemBuilder: (BuildContext context, int index) {
                      globalIndex = index;
                      return Form(index,context);
                    }),
              ),
            ),

            const Line(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIcon(
                      isBack:true,
                      text: 'Back',
                      goToPage: 6,
                      Width: size.width*0.4,
                      color: Colors.red,
                      icon:  const Icon(Icons.arrow_back_sharp,color: Colors.white,)),
                  ButtonWithIcon(
                      isBack:false,
                      text: 'Next',
                      goToPage: 8,
                      Width: size.width*0.4,
                      color: kButtonColor,
                      icon:  const Icon(Icons.arrow_forward,color: Colors.white,)),

                ],),
            ),
          ],
        ));
  }

  Widget Form(int index,BuildContext context){
    final app= Provider.of<AdditionalPricing>(context);
    var size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.only(left: 0,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Heading(title: 'Title'),
                    IconButton(onPressed: (){
                      setState(() {
                        form[index].titleController.text="";
                        form[index].priceController.text="";
                        form[index].fileName="";
                        deleteItem(form[index]);
                      });
                    }, icon: const Icon(Icons.delete,color: Colors.red,)),
                  ],
                )),
            const SizedBox(height: 10,),
            MyTextField(hintText: "Enter a title",controller: form[index].titleController),

            const SizedBox(height: 10,),
            const Heading(title: 'Icon',),
            const SizedBox(height: 10,),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: size.width ,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff3A3A3C),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: ()async{
                      await app.getImageFromGallery(context);
                      form[index].iconImage=app.iconImage;
                      form[index].fileName=app.fileName;
                    },
                      child: const Text("Upload"),
                      style: ElevatedButton.styleFrom(
                          primary: kButtonColor,
                          fixedSize: const Size(100, 50),
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    ),

                    form[index].iconImage==null?
                         const SizedBox(
                           child: Padding(
                             padding: EdgeInsets.only(left: 8.0),
                             child: Text("No image",style: TextStyle(color: Colors.white60),),
                           ),)
                       : SizedBox(
                     height: 50,
                     width: size.width*0.5,
                     child:  Padding(
                       padding: const EdgeInsets.only(left: 8.0,top: 12),
                       child: Text(form[index].fileName!,style: const TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,),
                     ),
                   )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10,),
            const Heading(title: 'Price',),
            const SizedBox(height: 10,),
            MyTextField(hintText: "Enter a Price",controller: form[index].priceController,),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }

}

