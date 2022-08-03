import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard({
    Key? key,
    required this.title,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  final String title;
  final String text;
  final String imagePath;


  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Container(
        decoration:  BoxDecoration(
          color: kDarkGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        width: size.width*0.7,
        height: 145,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(
                  height: 40,
                  width: size.width*0.2,
                  child:  Image(image: AssetImage(widget.imagePath))),
              const SizedBox(height: 8,),
              Text(widget.title,style: const TextStyle(color: Colors.white,fontSize: 15),),
              const SizedBox(height: 4,),
              Text(widget.text,style: const TextStyle(color: Colors.white,fontSize: 20),),
            ],),
        ),
      ),
    );
  }
}