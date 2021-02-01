import 'package:flutter/material.dart';
import 'package:swapi/models/models.dart';

class FilmInfo extends StatelessWidget {
  final Film film;
  final List<Character> characters;

  FilmInfo({Key key, @required this.film, @required this.characters})
      : assert(film != null && characters != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        shadowColor: Color(0x802196F3),
        elevation: 5.0,
        child: Column(
          children: <Widget>[
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("${film.title}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),
                        Text("${film.director}",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15.0)),
                        Text("${film.producer}",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15.0)),
                      ]),
                ),
                Expanded(
                  child: Container(
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
                )
              ],
            )),
            Container(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[Flexible(child: Text(film.openingCrawl))],
              ),
            )),
            ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: characters.length,
                separatorBuilder: (context, index) => Divider(
                      color: Colors.transparent,
                    ),
                itemBuilder: (BuildContext context, int index) {
                  final character = characters[index];
                  return Text(character.name);
                }),
          ],
        ));
  }
}
