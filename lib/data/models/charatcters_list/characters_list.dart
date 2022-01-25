import 'package:json_annotation/json_annotation.dart';
part 'characters_list.g.dart';

@JsonSerializable()
class Results {
  final String name;
  final String image;
  final String id;
  final String gender;

  Results({required this.name, required this.image, required this.id, required this.gender});
  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);

}


@JsonSerializable()
class Characters{
  final List<Results> results;

  Characters({required this.results});

  factory Characters.fromJson(Map<String, dynamic> json) => _$CharactersFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}

@JsonSerializable()
class CharactersResponse{
  final Characters characters;

  CharactersResponse({required this.characters});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) => _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}

