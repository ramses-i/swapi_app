import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;

  const Character({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender
  });

  @override
  List<Object> get props =>
      [name, height, mass, hairColor, eyeColor, birthYear, gender];

  static Character fromJson(dynamic json) {
    return Character(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      eyeColor: json['eye_color'],
      birthYear: json['birth_year'],
      gender: json['gender']

    );
  }
}
