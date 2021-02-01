import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  final String message;

  FailureScreen({Key key, @required this.message})
      : assert(message != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(color: Colors.red),
    );
  }
}
