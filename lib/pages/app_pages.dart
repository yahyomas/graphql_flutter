import 'package:get/get.dart';
import 'package:graphql_flutter/bindings/details_binding.dart';
import 'package:graphql_flutter/bindings/home_binding.dart';
import 'package:graphql_flutter/ui/pages/details/details_page.dart';
import 'package:graphql_flutter/ui/pages/home/home_page.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: HomePage.route,
        page: () => const HomePage(),
        binding: HomeBinding(),
    ),
    GetPage(
        name: DetailsPage.route,
        page: () => const DetailsPage(),
        binding: DetailsBinding(),
    ),

  ];
}
