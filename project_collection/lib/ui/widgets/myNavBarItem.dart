import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/helpers/static.dart';

import '../../style.dart';

class NavBarItem extends StatefulWidget {
  final String text;
  final Function onTap;

  NavBarItem({required this.text, required this.onTap});

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return GestureDetector(
      onTap: () => this.widget.onTap(),
      child: (StaticData.globalSize.width >= 860)
          ? HoverAnimatedContainer(
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
            )
          : InkWell(
              onTap: () {
                this.widget.onTap();
                Navigator.pop(context);
              },
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                    ),
                    child: Text(
                      this.widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: fontSizeLarge,
                        fontFamily: fontMont,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
