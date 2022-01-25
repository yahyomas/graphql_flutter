// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      name: json['name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      name: json['name'] as String,
      image: json['image'] as String,
      gender: json['gender'] as String,
      status: json['status'] as String,
      episode: (json['episode'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'gender': instance.gender,
      'status': instance.status,
      'episode': instance.episode,
    };

Characters _$CharactersFromJson(Map<String, dynamic> json) => Characters(
      results: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersToJson(Characters instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

DetailResponse _$DetailResponseFromJson(Map<String, dynamic> json) =>
    DetailResponse(
      characters:
          Characters.fromJson(json['characters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailResponseToJson(DetailResponse instance) =>
    <String, dynamic>{
      'characters': instance.characters,
    };
