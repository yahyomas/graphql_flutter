import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/controllers/home_controller.dart';
import 'package:graphql_flutter/ui/pages/details/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Список персонажей'),
        ),
        body: controller.results.isEmpty
            ? Center(
                child: controller.errorText != ''
                    ? Text(controller.errorText)
                    : const CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: controller.results.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(DetailsPage.route, arguments: {
                                'name': controller.results[index].name
                              });
                            },
                            child: Container(
                              height: 240,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: Get.width,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12)),
                                      child: CachedNetworkImage(
                                        progressIndicatorBuilder:
                                            (context, url, progress) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        },
                                        imageUrl:
                                            controller.results[index].image,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) {
                                          debugPrint(error.toString());
                                          return Text(error.toString());
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        controller.results[index].name,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      ),
                                      SvgPicture.asset(
                                        controller.results[index].gender ==
                                                'Male'
                                            ? 'assets/man.svg'
                                            : 'assets/woman.svg',
                                        height: 24,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
