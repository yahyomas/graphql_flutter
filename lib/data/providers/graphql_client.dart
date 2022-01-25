import 'package:graphql/client.dart';

class MyClient{
  static GraphQLClient? _client;

  static GraphQLClient getInstance(){
    if(_client != null){
      return _client!;
    }
    _client = _getGithubGraphQLClient();
    return _client!;
  }


  static GraphQLClient _getGithubGraphQLClient() {
    final Link _link = HttpLink(
      'https://rickandmortyapi.com/graphql',
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}