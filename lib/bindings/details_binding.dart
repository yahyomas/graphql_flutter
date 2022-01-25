import 'package:get/get.dart';
import 'package:graphql_flutter/controllers/details_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
