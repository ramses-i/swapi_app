import 'package:flutter/material.dart';

class ReleaseDate extends StatelessWidget {
  final DateTime dateTime;

  ReleaseDate({Key key, @required this.dateTime})
      : assert(dateTime != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Updated: ${TimeOfDay.fromDateTime(dateTime).format(context)}',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w200,
        color: Colors.black,
      ),
    );
  }
}
