import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrent/constants/constants.dart';
import 'package:vrent/providers/photos_provider.dart';
import 'package:vrent/widgets/bold_heading.dart';
import 'package:vrent/widgets/button_with_icon.dart';
import 'package:vrent/widgets/line.dart';
import 'package:vrent/widgets/mybutton.dart';

class Page6 extends StatefulWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    final photosProvider=Provider.of<PhotosProvider>(context);
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
                    const BoldHeading(title: 'Photos'),
                   photosProvider.imagesList!.isNotEmpty
                       ? InkWell(
                          child: const Text("clear all",style: TextStyle(color: Colors.red,fontSize: 15),),
                          onTap: (){
                          photosProvider.clearAll();
                         },)
                       : const SizedBox(),
                  ],
                )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Button(
                onPressed: () {
                photosProvider.selectImages();
              },
                text: 'Upload Photos'),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: size.height*0.5,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: photosProvider.imagesList!.length,
                    itemBuilder: (BuildContext context, int index){
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(File(photosProvider.imagesList![index].path),fit: BoxFit.cover,),
                          Positioned(
                              child: IconButton(
                                onPressed: () { photosProvider.deleteImage(index); },
                                icon: const Icon(Icons.delete,color: Colors.white,),),
                              top: 0,
                            right: 0,
                          ),
                        ],
                      );
                    }),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIcon(
                      isBack:true,
                      text: 'Back',
                      goToPage: 4,
                      Width: size.width*0.4,
                      color: Colors.red,
                      icon:  const Icon(Icons.arrow_back_sharp,color: Colors.white,)),
                  ButtonWithIcon(
                      isBack:false,
                      text: 'Next',
                      goToPage: 6,
                      Width: size.width*0.4,
                      color: kButtonColor,
                      icon:  const Icon(Icons.arrow_forward,color: Colors.white,)),

                ],),
            ),


          ],
        ));
  }
}
