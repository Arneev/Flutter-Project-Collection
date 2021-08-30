import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/ui/widgets/MySubHeading.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../style.dart';

class Paragraph extends StatelessWidget {
  const Paragraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    bool isPhone = (size.width < phoneWidth);
    return Container(
      alignment: Alignment.topCenter,
      width: (!isPhone) ? size.width * 0.5 : size.width * 0.8,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1 * 0.5, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: (!isPhone) ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment:
            (!isPhone) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          //About Heading
          MySubHeading(heading: "About"),
          MySpacing(
            height: 10,
          ),
          //Paragraph
          RichText(
            text: TextSpan(
              style:
                  paragraphTextStyle.copyWith(fontSize: fontSizeMedium * 0.9),
              children: <TextSpan>[
                TextSpan(text: "I am a "),
                TextSpan(
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
