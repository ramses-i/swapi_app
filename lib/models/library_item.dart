import 'package:equatable/equatable.dart';
class LibraryItem extends Equatable {
  final String title;
  final int episodeID;
  final String director;
  final DateTime releaseDate;


  const LibraryItem({
    this.title,
    this.episodeID,
    this.director,
    this.releaseDate,
  });

  @override
  List<Object> get props =>
      [title, episodeID, director, releaseDate];

  static LibraryItem fromJson(dynamic json) {
    return LibraryItem(
      title: json['title'],
      episodeID: json['episode_id'],
      director: json['director'],
      releaseDate: DateTime.tryParse(json['release_date'])
    );
  }
}
