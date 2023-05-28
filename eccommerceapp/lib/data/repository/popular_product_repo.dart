import 'package:eccommerceapp/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularPoductList() async{
    return await apiClient.getData("https://wwww.dbestech.com/api/product/list");
    //https://mvs.bslmeiyu.com/api/v1/products/popular
  }
}