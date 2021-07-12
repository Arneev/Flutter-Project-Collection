import 'package:flutter/material.dart';

//Font Sizes
const double fontSizeHeading = 48.0;
const double fontSizeLarge = 24.0;
const double fontSizeMedium = 20.0;
const double fontSizeSmall = 18.0;

//Fonts
const String fontMont = "Montserrat";
const String fontPacifico = "Pacifico";
const String fontDancingScript = "DancingScript";

//Static Colors
const Color darkNavyBlue = Color.fromARGB(255, 38, 53, 71);
const Color brightRed = Color.fromARGB(255, 253, 67, 69);
const Color mustard = Color.fromARGB(255, 255, 189, 89);

//Colors
const Color primaryColor = darkNavyBlue;

const Color secondaryColor = brightRed;

const Color widgetColor = Colors.white;

const Color textColor = darkNavyBlue;

const Color backgroundColor = darkNavyBlue;

//Standards
final BorderRadius borderRadius = BorderRadius.circular(150);

class MySpacing extends StatelessWidget {
  late final double height;

  MySpacing({this.height = 30});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: height));
  }
}

//My Text
// ignore: non_constant_identifier_names
Widget MyText({required String text, required Color color}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontFamily: fontMont,
      fontSize: fontSizeLarge,
    ),
  );
}
