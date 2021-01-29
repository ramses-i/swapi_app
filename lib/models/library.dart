import 'package:equatable/equatable.dart';
import 'models.dart';

class Library extends Equatable {
  final int count;
  final List<Film> results;

  const Library({this.count, this.results});

  @override
  List<Object> get props => [count, results];

  static Library fromJson(dynamic json) {
    int count = json['count'];
    List<dynamic> results = json['results'] as List<dynamic>;
    List<Film> lib = new List();

    for (int i = 0; i < results.length; i++) {
      lib.add(Film.fromJson(results[i]));
    }

    return Library(count: count, results: lib);
  }
}
