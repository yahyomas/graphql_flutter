// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      name: json['name'] as String,
      image: json['image'] as String,
      id: json['id'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
      'gender': instance.gender,
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

CharactersResponse _$CharactersResponseFromJson(Map<String, dynamic> json) =>
    CharactersResponse(
      characters:
          Characters.fromJson(json['characters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharactersResponseToJson(CharactersResponse instance) =>
    <String, dynamic>{
      'characters': instance.characters,
    };
