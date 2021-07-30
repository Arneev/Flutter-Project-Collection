import 'package:flutter/material.dart';

import '../../style.dart';

class MySubHeading extends StatelessWidget {
  final String heading;
  final TextStyle? optionalTextStyle;
  const MySubHeading({Key? key, required this.heading, this.optionalTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontFamily: fontMont,
        fontSize: fontSizeHeading,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.0,
      ).merge(optionalTextStyle?.apply()),
    );
  }
}
