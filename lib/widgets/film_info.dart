import 'package:flutter/material.dart';

class FilmInfo extends StatelessWidget {
  final String title;
  final double textSize;
  final FontWeight style;

  FilmInfo({Key key, @required this.title, @required this.textSize, @required this.style})
      : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: style,
        color: Colors.black,
      ),
    );
  }
}
