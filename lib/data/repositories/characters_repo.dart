import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/data/models/character_details/character_details.dart';
import 'package:graphql_flutter/data/models/charatcters_list/characters_list.dart';
import 'package:graphql_flutter/data/providers/graphql_client.dart';

abstract class CharactersRepo {
  Future<Either<String, CharactersResponse>> getAllCharacters();

  Future<Either<String, DetailResponse>> getCharacterDetails(String name);
}

class CharactersRepoImpl extends CharactersRepo {
  @override
  Future<Either<String, CharactersResponse>> getAllCharacters() async {
    final GraphQLClient _client = MyClient.getInstance();
    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
      query {
  characters(page: 1) {
    info {
      count,
      pages
    }
    results {
      name,
      image,
      id,
      gender
    }
  }
}
      ''',
      ),
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      return Left(result.exception!.graphqlErrors[0].message);
    } else {
      final response = CharactersResponse.fromJson(result.data!);
      return Right(response);
    }
  }

  @override
  Future<Either<String, DetailResponse>> getCharacterDetails(
      String name) async {
    final GraphQLClient _client = MyClient.getInstance();
    final QueryOptions options = QueryOptions(
      document: gql(
        'query {characters(filter: { name :"$name" }) {info {count}results {name,image,gender,status,episode{name,id}}}}',
      ),
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      return Left(result.exception!.graphqlErrors[0].message);
    } else {
      final response = DetailResponse.fromJson(result.data!);
      return Right(response);
    }
  }
}
