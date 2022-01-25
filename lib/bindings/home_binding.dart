import 'package:get/get.dart';
import 'package:graphql_flutter/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }

}