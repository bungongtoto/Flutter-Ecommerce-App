import 'package:eccommerceapp/controllers/popular_product_controller.dart';
import 'package:eccommerceapp/data/api/api_client.dart';
import 'package:eccommerceapp/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init()async{
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://wwww.dbestech.com'));
  
  // repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}