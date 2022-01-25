import 'package:get/get.dart';
import 'package:graphql_flutter/data/models/charatcters_list/characters_list.dart';
import 'package:graphql_flutter/data/repositories/characters_repo.dart';

class HomeController extends GetxController {
  List<Results> results = [];
  String errorText = '';
  late CharactersRepo charactersRepo;

  @override
  void onInit() {
    charactersRepo = CharactersRepoImpl();
    getData();
    super.onInit();
  }

  void getData() async {
    final res = await charactersRepo.getAllCharacters();
    res.fold((l) {
      errorText = l;
    }, (r) {
      results = r.characters.results;
    });
    update();
  }
}
