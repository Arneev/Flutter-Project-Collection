import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../style.dart';

class Paragraph extends StatelessWidget {
  const Paragraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      height: size.height * aboutHeight,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1 * 0.5, vertical: 30),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //About Heading
          Text(
            "About",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontFamily: fontMont,
              fontSize: fontSizeHeading,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.0,
            ),
          ),
          //Paragraph
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
                fontFamily: fontMont,
                height: 1.5,
                fontSize: fontSizeSmall,
                fontWeight: FontWeight.w300,
              ),
              children: <TextSpan>[
                TextSpan(text: "I am a "),
                TextSpan(
                  onEnter: (_) {
                    //TODO: Animation for hover
                  },
                  text: "Flutter",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTertiaryTapDown = (_) {
                      launch("https://flutter.dev/");
                    }
                    ..onTap = () {
                      launch("https://flutter.dev/");
                    },
                ),
                TextSpan(
                  text:
                      " addict and I love making all different types of apps. From time to time, I will dabble with Unity and develop a game.  I seek out challenging and fun problems. Some of my interests include Machine Learning and Quantum Computing.",
                ),
                TextSpan(
                  text:
                      "\n\nI have a passion for learning new concepts and different ways of doing algorithms. I find the world a fascinating place, especially with the technology that we have! ",
                ),
                TextSpan(
                    text:
                        "\n\nI want to learn a lot of things in the world. I am still on a journey to figure out which one I should start with first. "),
                TextSpan(
                  text: "\n\nOne day I'd like to travel the world!",
                ),
                TextSpan(
                  text: "\n(And hopefully to space!)",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
