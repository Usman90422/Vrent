import 'package:flutter/material.dart';

class IconTile extends StatefulWidget {

  const IconTile({required this.text,required this.imagePath,required this.onTap}) ;

  final String text;
  final String imagePath;
  final VoidCallback onTap;

  @override
  State<IconTile> createState() => _IconTileState();
}

class _IconTileState extends State<IconTile> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            SizedBox(
              height: 26,
              width: size.width*0.2,
              child:  Image(image: AssetImage(widget.imagePath),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10,top: 0),
              child: SizedBox(
                  width: size.width*0.5,
                  child:  Text(widget.text,style: const TextStyle(color: Colors.white,fontSize: 15),)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: size.width*0.1,
                child: const Icon(Icons.arrow_forward,color: Colors.white,),
              ),
            )
          ],),
      ),
    );
  }
}
