import 'package:eccommerceapp/colors/colors.dart';
import 'package:eccommerceapp/utills/dimensions.dart';
import 'package:eccommerceapp/widgets/big_text.dart';
import 'package:eccommerceapp/widgets/expanding_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:eccommerceapp/widgets/app_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: Dimensions.height30*2 + Dimensions.height10,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.add_shopping_cart_outlined,)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top:Dimensions.height10/2, bottom: Dimensions.height10),
        
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),

                child: Center(
                  child: BigText(text: "Good Food", color: AppColors.bigtextColor, size:Dimensions.font26),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.skyColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assests/images/food1.webp",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
         SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right:Dimensions.width20 ),
                  child: const ExpandableText(text: "The process methodology is used to understand the processes used to accomplish the task in computer science. This methodology is most used in the areas of software engineeringand non-machine Interface which deals with the way humans build and use computer systems. The study of processing may also be used to understands cognition in the field of Artificial Intelligence.Process methodology can mostly be useful the study of activities that involve humans. Examples in computer science are design and construction of software systems with most recently the creation of interactive games have been studied intensively. So, we can conclude that computer Science researchers will be advantageous using this methodolog The process methodology is used to understand the processes used to accomplish the task in computer science. This methodology is most used in the areas of software engineeringand non-machine Interface which deals with the way humans build and use computer systems. The study of processing may also be used to understands cognition in the field of Artificial Intelligence. The process methodology is used to understand the processes used to accomplish the task in computer science. This methodology is most used in the areas of software engineeringand non-machine Interface which deals with the way humans build and use computer systems. The study of processing may also be used to understands cognition in the field of Artificial Intelligence.Process methodology can mostly be useful the study of activities that involve humans. Examples in computer science are design and construction of software systems with most recently the creation of interactive games have been studied intensively. So, we can conclude that computer Science researchers will be advantageous using this methodolog The process methodology is used to understand the processes used to accomplish the task in computer science. This methodology is most used in the areas of software engineeringand non-machine Interface which deals with the way humans build and use computer systems. The study of processing may also be used to understands cognition in the field of Artificial Intelligence. The process methodology is used to understand the processes used to accomplish the task in computer science. This methodology is most used in the areas of software engineeringand non-machine Interface which deals with the way humans build and use computer systems. The study of processing may also be used to understands cognition in the field of Artificial Intelligence.Process methodology can mostly be useful the study of activities that involve humans. Examples in computer science are design and construction of software systems with most recently the creation of interactive games have been studied intensively. So, we can conclude that computer Science researchers will be advantageous using this methodolog The process methodology is used to understand the processes used to accomplish the task in computer science. This methodology is most used in the areas of software engineeringand non-machine Interface which deals with the way humans build and use computer systems. The study of processing may also be used to understands cognition in the field of Artificial Intelligence."),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.add,backgroundColor: AppColors.mainColor, iconColor: Colors.white,iconSize: Dimensions.iconSize24,),
                BigText(text: "FCFA 4000 X 0", color: AppColors.bigtextColor,size: Dimensions.font26,),
                AppIcon(icon: Icons.remove,backgroundColor: AppColors.mainColor, iconColor: Colors.white,iconSize: Dimensions.iconSize24,),
              ],
            ),
          ),
          Container(
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
                  child: const Icon(
                    Icons.favorite,
                    color: AppColors.mainColor, 
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width10/2, right: Dimensions.width10/2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(text: "6000frs| Add to Cart", color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}