import 'package:equatable/equatable.dart';

class Film extends Equatable {
  final String title;
  final int episodeID;
  final String openingCrawl;
  final String director;
  final String producer;
  final DateTime releaseDate;
  final List<dynamic> charactersUrl;

  Film({
    this.title,
    this.episodeID,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    this.charactersUrl,
  });

  @override
  List<Object> get props => [
        title,
        episodeID,
        openingCrawl,
        director,
        producer,
        releaseDate,
        charactersUrl,
      ];

  static Film fromJson(dynamic json) {
    return Film(
        title: json['title'],
        episodeID: json['episode_id'],
        openingCrawl: json['opening_crawl'],
        director: json['director'],
        producer: json['producer'],
        releaseDate: DateTime.tryParse(json['release_date']),
        charactersUrl: json['characters'] as List<dynamic>);
  }
}
