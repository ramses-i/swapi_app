import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi/blocs/blocs.dart';
import 'package:swapi/widgets/film.dart';
import 'package:swapi/repositories/swapi_repository.dart';
import 'blocs/film_bloc/film_bloc.dart';


class App extends StatelessWidget {
  final FilmRepository filmRepo;

  App({Key key, @required this.filmRepo})
      : assert(filmRepo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swapi App',
      home: BlocProvider(
        create: (context) => FilmBloc(filmRepository: filmRepo),
        child: Film(),
      ),
    );
  }
} 
