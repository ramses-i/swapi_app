import 'package:equatable/equatable.dart';
import 'package:swapi/models/models.dart';
import 'package:meta/meta.dart';

abstract class FilmState extends Equatable {
  const FilmState();

  @override
  List<Object> get props => [];
}

class FilmLibraryInitial extends FilmState {
}

class FilmLoadInProgress extends FilmState {}

class FilmLoadSuccess extends FilmState {
  final Film film;

  const FilmLoadSuccess({@required this.film}) : assert(film != null);

  @override
  List<Object> get props => [film];
}

class FilmLoadFailure extends FilmState {}

//
class FilmLibraryInProgress extends FilmState{
}

class FilmLibraryLoadSuccess extends FilmState{
 final Library lib;

  const FilmLibraryLoadSuccess({@required this.lib}) : assert(lib != null);

  @override
  List<Object> get props => [lib];
}

class FilmLibraryLoadFailure extends FilmState{
}