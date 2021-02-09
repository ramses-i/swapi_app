import 'package:swapi/repositories/swapi_api_client.dart';
import 'package:meta/meta.dart';
import 'package:swapi/models/models.dart';

class FilmRepository {
  final SwapiApiClient swapiClient;

  FilmRepository({@required this.swapiClient}) : assert(swapiClient != null);

  Future<Library> getFullLibrary() async {
    return swapiClient.fetchFullLibrary();
  }

  Future<Film> getFilm(String filmId) async {
    return swapiClient.fetchFilm(filmId);
  }

  Future<Character> getCharacter(String characterURL) async {
    return swapiClient.fetchCharacter(characterURL);
  }

}
