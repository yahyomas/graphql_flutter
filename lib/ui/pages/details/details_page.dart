import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/controllers/details_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  static const route = '/details_page';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Детали персонажа'),
        ),
        body: controller.results == null
            ? Center(
                child: controller.errorText != ''
                    ? Text(controller.errorText)
                    : const CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 200,
                      width: Get.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          imageUrl: controller.results!.image,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          controller.results!.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                        SvgPicture.asset(
                          controller.results!.gender == 'Male'
                              ? 'assets/man.svg'
                              : 'assets/woman.svg',
                          height: 24,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Cтатус:',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          controller.results!.status,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Text(
                            controller.results!.episode[index].name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                        itemCount: controller.results!.episode.length)
                  ],
                ),
              ),
      );
    });
  }
}
