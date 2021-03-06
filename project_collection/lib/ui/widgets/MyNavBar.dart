import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/helpers/navigation_helper.dart';
import 'package:project_collection/style.dart';

import 'myNavBarItem.dart';

class MyNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      alignment: Alignment.center,
      width: size.width * 0.8,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.blue,
        gradient: LinearGradient(
          colors: [
            Colors.blue.withAlpha(128),
            Colors.purple[300]!.withAlpha(128),
            // Colors.blue.withAlpha(128)
            Colors.red.withAlpha(128),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(500),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: size.width * 0.075, right: size.width * 0.025),
            child: _NavHeading(),
          ),
          if (size.width > 860)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavBarItem(text: "About", onTap: () => goToAbout(context)),
                  NavBarItem(
                      text: "Projects", onTap: () => goToProjects(context)),
                  NavBarItem(text: "Skills", onTap: () => goToSkills(context)),
                  NavBarItem(
                      text: "Contact", onTap: () => goToContact(context)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _NavHeading extends StatefulWidget {
  const _NavHeading({Key? key}) : super(key: key);

  @override
  __NavHeadingState createState() => __NavHeadingState();
}

class __NavHeadingState extends State<_NavHeading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Arneev Singh",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: fontPacifico,
          color: Colors.white,
          fontSize: fontSizeHeading,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
