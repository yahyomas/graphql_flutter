
import 'package:json_annotation/json_annotation.dart';
part 'character_details.g.dart';

@JsonSerializable()
class Episode{
  Episode({
    required this.name,
    required this.id,
  });
  final String name;
  final String id;

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

}

@JsonSerializable()
class Results {
  Results({
    required this.name,
    required this.image,
    required this.gender,
    required this.status,
    required this.episode,
  });
  final String name;
  final String image;
  final String gender;
  final String status;
  final List<Episode> episode;


  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);

}


@JsonSerializable()
class Characters {
  Characters({
    required this.results,
  });
  final List<Results> results;

  factory Characters.fromJson(Map<String, dynamic> json) => _$CharactersFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}




@JsonSerializable()
class DetailResponse {
  DetailResponse({
    required this.characters,
  });
  final Characters characters;

  factory DetailResponse.fromJson(Map<String, dynamic> json) => _$DetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailResponseToJson(this);

}