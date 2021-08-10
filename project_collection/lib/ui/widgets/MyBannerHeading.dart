import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';

import '../../style.dart';

class MyBannerHeading extends StatelessWidget {
  final String headingText;
  final Color color;
  final EdgeInsets padding;

  const MyBannerHeading(
      {Key? key,
      required this.headingText,
      required this.color,
      this.padding = const EdgeInsets.symmetric(vertical: 5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      alignment: Alignment.center,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Colors.orange.withAlpha(64),
            // Colors.red.withAlpha(64),
            color,
            color,
            // Colors.blue.withAlpha(64),
            // Colors.green.withAlpha(64),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      width: size.width,
      child: Text(
        headingText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: fontPacifico,
          fontSize: fontSizeHeading,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.0,
        ),
        textScaleFactor: 2.0,
      ),
    );
  }
}
