import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapi/widgets/film_info.dart';

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
              return Center(
                child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: state.lib.results.length,
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      final libItem = state.lib.results[index];
                      return Column(
                        children: <Widget>[
                          Text(libItem.title,
                              style: Theme.of(context).textTheme.headline5),
                          Text(libItem.director),
                        ],
                      );
                    }),
              );
            }
            if (state is FilmLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is FilmLoadSuccess) {
              final film = state.film;

              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: FilmInfo(
                          title: film.title,
                          textSize: 30,
                          style: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: FilmInfo(
                      title: film.director,
                      textSize: 20,
                      style: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: FilmInfo(
                      title: film.openingCrawl,
                      textSize: 15,
                      style: FontWeight.normal,
                    ),
                  ),
                ],
              );
            }
            if (state is FilmLoadFailure) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}
