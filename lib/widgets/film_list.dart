import 'package:flutter/material.dart';
import 'package:swapi/models/models.dart';
import 'package:swapi/widgets/film_list_item.dart';

class FilmList extends StatelessWidget {
  final List<LibraryItem> films;

  FilmList({
    Key key,
    @required this.films,
  })  : assert(films != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: films.length,
        separatorBuilder: (context, index) => Divider(
              color: Colors.transparent,
            ),
        itemBuilder: (BuildContext context, int index) {
          final film = films[index];
          return FilmListItem(film: film);
        });
  }
}
