import 'package:flutter/material.dart';

//Font Sizes
const double fontSizeHeading = 48.0;
const double fontSizeLarge = 24.0;
const double fontSizeMedium = 20.0;
const double fontSizeSmall = 18.0;

//Fonts
const String fontMont = "Comfortaa";
const String fontPacifico = "Pacifico";
const String fontDancingScript = "DancingScript";

//Static Colors
const Color darkNavyBlue = Color.fromARGB(255, 38, 53, 71);
const Color brightRed = Color.fromARGB(255, 253, 67, 69);
const Color mustard = Color.fromARGB(255, 255, 189, 89);

const Color darkPurple = Color.fromARGB(255, 156, 40, 177);
const Color purple = Color.fromARGB(255, 185, 104, 199);
const Color grey = Color.fromARGB(255, 97, 97, 97);

const Color teal = Color.fromARGB(255, 1, 150, 136);
const Color peach = Color.fromARGB(255, 255, 167, 129);

//Colors
const Color primaryColor = darkNavyBlue;

const Color secondaryColor = brightRed;

const Color widgetColor = Colors.white;

const Color textColor = darkNavyBlue;

const Color backgroundColor = darkNavyBlue;

//Heights
double aboutHeight = 0.8;
double projectHeightOffset = 45;

//Standards
final BorderRadius borderRadius = BorderRadius.circular(150);

final int backAlpha = 48;
final LinearGradient backgroundGradient = LinearGradient(
  end: Alignment.bottomCenter,
  begin: Alignment.topCenter,
  colors: [
    Colors.red.withAlpha(backAlpha + 20),
    // Colors.purple.withAlpha(backAlpha + 10),
    Colors.blue.withAlpha(backAlpha),
    // Colors.purple.withAlpha(backAlpha + 10),
  ],
);

final paragraphTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: fontMont,
  height: 1.5,
  fontSize: fontSizeSmall,
  fontWeight: FontWeight.w300,
);

//Layout Widgets

class MySpacing extends StatelessWidget {
  late final double height;

  MySpacing({this.height = 5});

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
