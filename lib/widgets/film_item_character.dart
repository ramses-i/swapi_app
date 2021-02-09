import 'package:flutter/material.dart';
import 'package:swapi/models/models.dart';

class FilmCharacterItem extends StatelessWidget {
  final Character character;

  FilmCharacterItem({
    Key key,
    @required this.character,
  })  : assert(character != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      elevation: 5.0,
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(character.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  Text(character.name,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15.0)),
                ]),
          ),
          Container(
            width: 120,
            height: 180,
            child: ClipRRect(
              child: Image(
                fit: BoxFit.contain,
                alignment: Alignment.topRight,
                image: NetworkImage(
                    "https://c8.alamy.com/compes/b3kr2h/poster-de-star-wars-para-el-1977-tcf-lucasfilm-film-b3kr2h.jpg"),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
