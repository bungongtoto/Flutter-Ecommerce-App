import 'package:flutter/material.dart';
import 'package:eccommerceapp/widgets/big_text.dart';
import 'package:eccommerceapp/utills/dimensions.dart';
import 'package:eccommerceapp/widgets/app_icon.dart';
import 'package:eccommerceapp/widgets/app_column.dart';
import 'package:eccommerceapp/colors/colors.dart';
import 'package:eccommerceapp/widgets/expanding_text_widget.dart';


class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:  AssetImage(
                    "assests/images/food2.jpg"
                  ),
                ),
              ),
            ),
          ), 
          // icon row
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right:Dimensions.width20 ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                AppIcon(icon: Icons.arrow_back),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //food detail description
          Positioned(
            left: 0,
            right: 0,
            bottom: 0, 
            top: Dimensions.popularFoodImgSize-Dimensions.height20,
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height10,left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: "Pizza a LIO"),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: 'Introduce', color:Colors.black),
                  SizedBox(height: Dimensions.height20,),
                  const Expanded(
                     child: SingleChildScrollView(
                      child: ExpandableText(text: "The process methodology is used to understand the processes used to accomplish the task in computer science. This methodology is most used in the areas of software engineeringand non-machine Interface which deals with the way humans build and use computer systems. The study of processing may also be used to understands cognition in the field of Artificial Intelligence.Process methodology can mostly be useful the study of activities that involve humans. Examples in computer science are design and construction of software systems with most recently the creation of interactive games have been studied intensively. So, we can conclude that computer Science researchers will be advantageous using this methodolog The process methodology is used to understand the processes used to accomplish the task in computer science. This methodology is most used in the areas of software engineeringand non-machine Interface which deals with the way humans build and use computer systems. The study of processing may also be used to understands cognition in the field of Artificial Intelligence."),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          

        ],
      ),
      bottomNavigationBar: Container(
        height:Dimensions.height20*5,
        padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width10,left: Dimensions.width10),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2) ,
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.remove,color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: "0", color: AppColors.bigtextColor),
                  SizedBox(width: Dimensions.width5,),
                  const Icon(Icons.add,color: AppColors.signColor,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width10/2, right: Dimensions.width10/2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(text: "6000FCFA| Add to Cart", color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}