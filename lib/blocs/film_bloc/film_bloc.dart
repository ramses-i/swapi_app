import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:swapi/blocs/film_bloc/film_state.dart';
import 'package:swapi/blocs/film_bloc/film_event.dart';
import 'package:swapi/repositories/repositories.dart';
import 'package:swapi/models/models.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final FilmRepository filmRepository;

  FilmBloc({@required this.filmRepository})
      : assert(filmRepository != null),
        super(FilmLibraryInitial());

  @override
  Stream<FilmState> mapEventToState(FilmEvent event) async* {
    if (event is FilmLibraryStart) {
      yield FilmLibraryInProgress();
      try {
        final Library library = await filmRepository.getFullLibrary();
        yield FilmLibraryLoadSuccess(lib: library);
      } catch (_) {
        yield FilmLibraryLoadFailure();
      }
    }

    if (event is FilmRequested) {
      yield FilmLoadInProgress();
      try {
        final Film film = await filmRepository.getFilm(event.filmId);
        final People people = await filmRepository.getCharacters();
        List<Character> results = filmRepository.filterResults(film, people);
        yield FilmLoadSuccess(film: film, cast: results);
      } catch (_) {
        yield FilmLoadFailure();
      }
    }
  }

 
}
