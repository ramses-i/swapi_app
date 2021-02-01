import 'package:flutter/material.dart';

class FilmCharacters extends StatelessWidget {
  final List<dynamic> characters;

  FilmCharacters({
    Key key,
    @required this.characters,
  })  : assert(characters != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: characters.length,
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
        itemBuilder: (BuildContext context, int index) {
          final character = characters[index];
          return Column(
            children: <Widget>[
              Text(character, style: Theme.of(context).textTheme.headline5),
            ],
          );
        });
  }
}
