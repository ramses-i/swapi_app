import 'package:flutter/material.dart';
import 'package:swapi/repositories/repositories.dart';
import 'package:swapi/simple_bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'app.dart';
void main() {
  Bloc.observer = SimpleBlocObserver();
  final FilmRepository filmRepo = FilmRepository(
    swapiClient: SwapiApiClient(httpClient: http.Client(),)
  );
  runApp(App(filmRepo: filmRepo));
}
