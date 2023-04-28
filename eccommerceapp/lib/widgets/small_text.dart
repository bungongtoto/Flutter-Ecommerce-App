import 'package:eccommerceapp/utills/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:eccommerceapp/colors/colors.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  final double size;
  double height;
  SmallText({required this.text,
   this.color ,
   super.key,
   this.size =0,
   this.height = 1.2,
   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color!= AppColors.textColor?color:AppColors.textColor,
        fontFamily: 'Roboto',
        fontSize: size==0?Dimensions.font12:size,
        height: height,
      ),
    );
  }
}