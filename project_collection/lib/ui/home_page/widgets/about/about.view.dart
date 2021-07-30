import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/style.dart';
import 'package:project_collection/ui/home_page/widgets/about/aboutDetails.dart';
import 'package:project_collection/ui/home_page/widgets/about/details.dart';
import 'package:project_collection/ui/home_page/widgets/header/header.dart';
import 'package:url_launcher/url_launcher.dart';

final double aboutHeight = 0.8;

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  final int aboutWidth = 50;
  final Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);

    return Container(
      alignment: Alignment.topCenter,
      width: size.width * 1,
      margin: EdgeInsets.only(bottom: 15, top: 30),
      decoration: BoxDecoration(
        color: Colors.black54,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
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
    );
  }
}
