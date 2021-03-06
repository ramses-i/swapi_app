import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swapi/models/library.dart';
import 'package:swapi/models/models.dart';
import 'package:meta/meta.dart';
import 'package:swapi/models/people.dart';

class SwapiApiClient {
  static const baseUrl = 'https://swapi.dev/api';
  final http.Client httpClient;

  SwapiApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Library> fetchFullLibrary() async {
    final filmBranchUrl = '$baseUrl/films';
    final filmBranchResponse = await this.httpClient.get(filmBranchUrl);
    if (filmBranchResponse.statusCode != 200) {
      throw Exception("Error getting the film branch info");
    }
    final filmBranchJson =
        jsonDecode(filmBranchResponse.body) as Map<String, dynamic>;
    return Library.fromJson(filmBranchJson);
  }

  Future<Film> fetchFilm(String filmId) async {
    final filmUrl = '$baseUrl/films/$filmId/';

    final filmResponse = await this.httpClient.get(filmUrl);
    if (filmResponse.statusCode != 200) {
      throw Exception("Error getting the film");
    }
    final filmJson = jsonDecode(filmResponse.body) as Map<String, dynamic>;
    return Film.fromJson(filmJson);
  }

  Future<Character> fetchCharacter(String url) async {
    final characterResponse = await this.httpClient.get(url);
    if (characterResponse.statusCode != 200) {
      throw Exception("Error getting the character");
    }
    final characterInfo =
        jsonDecode(characterResponse.body) as Map<String, dynamic>;
    return Character.fromJson(characterInfo);
  }

  Future<People> fetchCharacters() async {
    final peopleBranchURL = '$baseUrl/people';
    final peopleBranchResponse = await this.httpClient.get(peopleBranchURL);
    if (peopleBranchResponse.statusCode != 200) {
      throw Exception("Error getting the film branch info");
    }
    final peopleBranchJSON =
        jsonDecode(peopleBranchResponse.body) as Map<String, dynamic>;
    return People.fromJson(peopleBranchJSON);
  }
}
