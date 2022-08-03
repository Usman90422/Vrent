import 'package:flutter/material.dart';
import 'package:vrent/constants/constants.dart';

class MyRangeSlider extends StatefulWidget {
   MyRangeSlider({required this.rangeValues ,required this.min,required this.max,this.endRange,this.startRange}) ;

   late  RangeValues rangeValues;
  final double max;
  final double min;
  late String? startRange;
  late String? endRange;

  @override
  _MyRangeSliderState createState() => _MyRangeSliderState();
}

class _MyRangeSliderState extends State<MyRangeSlider> {

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text("${widget.startRange==null?"20":widget.startRange} \$ ",style: TextStyle(color: Colors.white),)),
      ),
      RangeSlider(
        values: widget.rangeValues,
        activeColor: Colors.black,
        inactiveColor: kDarkGrey.withOpacity(0.3),
        onChanged: (newValue){
          setState(() {
            widget.rangeValues=newValue;
            widget.startRange=newValue.start.toInt().toString();
            widget.endRange= newValue.end.toInt().toString();
          });
        },
        max: widget.max,
        min: widget.min,
      ),
      Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(" ${widget.endRange==null?"1000":widget.endRange} \$",style: TextStyle(color: Colors.white),)),
      ),
    ],);


  }
}
