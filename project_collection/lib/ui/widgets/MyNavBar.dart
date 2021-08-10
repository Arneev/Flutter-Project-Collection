import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/helpers/navigation_helper.dart';
import 'package:project_collection/style.dart';

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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NavBarItem(text: "About", onTap: () => goToAbout(context)),
                _NavBarItem(
                    text: "Projects", onTap: () => goToProjects(context)),
                _NavBarItem(text: "Skills", onTap: () => goToSkills(context)),
                _NavBarItem(text: "Contact", onTap: () => goToContact(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String text;
  final Function onTap;

  _NavBarItem({required this.text, required this.onTap});

  @override
  __NavBarItemState createState() => __NavBarItemState();
}

class __NavBarItemState extends State<_NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.widget.onTap(),
      child: HoverAnimatedContainer(
        padding: EdgeInsets.all(5),
        curve: Curves.ease,
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        hoverDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        child: Text(
          this.widget.text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: fontMont,
            fontSize: fontSizeMedium,
            letterSpacing: 1.1,
            fontWeight: FontWeight.w300,
          ),
        ),
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
