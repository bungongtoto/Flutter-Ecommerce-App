import 'package:flutter/material.dart';
import 'package:eccommerceapp/pages/home/main_food_page.dart';
import 'package:eccommerceapp/pages/food/popular_food_detail.dart';
import 'package:get/get.dart';
import 'package:eccommerceapp/pages/food/recomended_food_detailed_page.dart';
import 'helper/dependencies.dart' as dep;

 main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MainFoodPage(),
    );
  }
}
