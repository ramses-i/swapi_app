import 'package:equatable/equatable.dart';
import 'models.dart';

class People extends Equatable {
  final int count;
  final List<Character> results;

  const People({this.count, this.results});

  @override
  List<Object> get props => [count, results];

  static People fromJson(dynamic json) {
    int count = json['count'];
    List<dynamic> results = json['results'] as List<dynamic>;
    List<Character> lib = new List();

    for (int i = 0; i < results.length; i++) {
      lib.add(Character.fromJson(results[i]));
    }

    return People(count: count, results: lib);
  }
}
