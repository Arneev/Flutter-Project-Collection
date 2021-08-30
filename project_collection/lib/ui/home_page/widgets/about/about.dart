import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/style.dart';
import 'package:project_collection/ui/home_page/widgets/about/aboutDetails.dart';
import 'package:project_collection/ui/home_page/widgets/about/details.dart';
import 'package:project_collection/ui/home_page/widgets/header/header.dart';
import 'package:url_launcher/url_launcher.dart';

final double aboutHeight = 0.8;

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final int aboutWidth = 60;
  final Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      key: this.widget.key,
      alignment: Alignment.topCenter,
      width: size.width * 1,
      margin: EdgeInsets.only(bottom: 15, top: 0),
      decoration: BoxDecoration(
        color: Colors.black54,
      ),
      //Desktop Layout
      child: (size.width > phoneWidth)
          ? IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: aboutWidth,
                    child: Paragraph(),
                  ),
                  Expanded(
                    flex: 100 - aboutWidth,
                    child: Details(),
                  ),
                ],
              ),
            )
          //Phone Layout
          : Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Details(),
                  Paragraph(),
                ],
              ),
            ),
    );
  }
}
