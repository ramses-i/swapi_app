import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi/widgets/failure_screen.dart';
import 'package:swapi/widgets/film_info.dart';
import 'package:swapi/widgets/film_list.dart';

import 'package:swapi/widgets/widgets.dart';
import 'package:swapi/blocs/blocs.dart';

class Film extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FilmBloc>(context).add(FilmLibraryStart());
    return Scaffold(
      appBar: AppBar(
        title: Text('Swapi'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final filmId = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilmSelection(),
                ),
              );
              if (filmId != null) {
                BlocProvider.of<FilmBloc>(context)
                    .add(FilmRequested(filmId: filmId));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<FilmBloc, FilmState>(
          builder: (context, state) {
            if (state is FilmLibraryInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is FilmLibraryLoadSuccess) {
              return FilmList(films: state.lib.results);
            }
            if (state is FilmLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is FilmLoadSuccess) {
              return FilmInfo(film: state.film, cast: state.cast,);
            }
            if (state is FilmLoadFailure) {
              return FailureScreen(message: "Something didnt work out!");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
