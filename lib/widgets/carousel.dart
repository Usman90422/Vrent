
import 'package:flutter/material.dart';


class Carousel extends StatefulWidget {
  const Carousel({required this.imageList,this.isDetailScreen,this.height,this.indicatorPosition}) ;

  final List imageList;
  final bool? isDetailScreen;
  final double? height;
  final double? indicatorPosition;

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  int _selectedPage=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
          boxShadow: const [BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 1,
          )]
      ),
      height: widget.height==null? 200 : widget.height ,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (num){
              setState(() {
                _selectedPage=num;
              });
            },
            children: [
              for(int i=0; i<widget.imageList.length; i++)
                Container(
                  height: 300,
                  child: ClipRRect(
                    borderRadius: widget.isDetailScreen==false
                    ?const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                    :const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image(image: AssetImage("${widget.imageList[i]}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

            ],

          ),
          Positioned(
            bottom: 0,
            top: widget.indicatorPosition==null ?150 : widget.indicatorPosition ,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                for(int i=0; i<widget.imageList.length; i++)
                  if(_selectedPage==_selectedPage)
                    AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeOutCubic,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: _selectedPage == i ? 20 : 10,
                      height: 8,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

