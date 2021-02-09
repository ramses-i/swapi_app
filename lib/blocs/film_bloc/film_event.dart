import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FilmEvent extends Equatable {
  const FilmEvent();

  @override
  List<Object> get props => [];
}

class FilmLibraryStart extends FilmEvent {}

class FilmRequested extends FilmEvent {
  final String filmId;

  const FilmRequested({@required this.filmId}) : assert(filmId != null);

  @override
  List<Object> get props => [filmId];
}
