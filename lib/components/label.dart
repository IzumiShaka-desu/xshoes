import 'package:flutter/material.dart';
import 'package:xshoes/constant.dart';

class Label extends StatelessWidget {
  Label({@required this.height, @required this.width, this.text,@required this.padding,});
  final double height, width;
  final EdgeInsetsGeometry padding;
  final String text;
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 1,
        child: Container(
          padding: padding,
            child: Center(child: RotatedBox(quarterTurns: 2,child: Text(text??'',style: TextStyle(fontWeight:FontWeight.bold,color: background),)),),
            height: height,
            width: width,
            decoration: BoxDecoration(
              
                color: primaryCardBlue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20)))));
  }
}
