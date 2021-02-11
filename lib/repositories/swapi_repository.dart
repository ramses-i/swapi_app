import 'package:swapi/models/people.dart';
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

  Future<People> getCharacters() async {
    return swapiClient.fetchCharacters();
  }

  Future<Character> getCharacter(String characterURL) async {
    return swapiClient.fetchCharacter(characterURL);
  }

  List<Character> filterResults(Film film, People people) {
    List<Character> results = [];
    for (var i = 0; i < film.charactersUrl.length; i++) {
      for (var j = 0; j < people.results.length; j++) {
        if (film.charactersUrl[i] == people.results[j].url) {
          results.add(people.results[j]);
        }
      }
    }
    return results;
  }
}
