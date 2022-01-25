import 'package:get/get.dart';
import 'package:graphql_flutter/data/models/character_details/character_details.dart';
import 'package:graphql_flutter/data/repositories/characters_repo.dart';

class DetailsController extends GetxController {
  Results? results;
  String errorText = '';
  late CharactersRepo charactersRepo;

  @override
  void onInit() {
    charactersRepo = CharactersRepoImpl();
    getData();
    super.onInit();
  }

  void getData() async {
    final String name = Get.arguments['name'];
    final res = await charactersRepo.getCharacterDetails(name);
    res.fold((l) {
      errorText = l;
    }, (r) {
      results = r.characters.results[0];
    });
    update();
  }
}
