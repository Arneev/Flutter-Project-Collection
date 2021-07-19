import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/ui/home_page/widgets/header/header.helper.dart';
import 'package:project_collection/ui/widgets/MyNavBar.dart';

import '../../../../style.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      width: size.width,
      padding: EdgeInsets.only(bottom: 35),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black.withAlpha(255),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ),
      ),
      child: ClipPath(
        clipper: MyClipper(),
        child: ImageRotater(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              MySpacing(height: 25),
              MyNavBar(),
              Container(
                padding: EdgeInsets.all(25),
                alignment: Alignment.center,
                width: size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Artistically",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withAlpha(205),
                        fontFamily: fontPacifico,
                        fontWeight: FontWeight.w300,
                        fontSize: fontSizeHeading,
                      ),
                      textScaleFactor: 1.3,
                    ),
                    MySpacing(height: 5),
                    Text(
                      "Minimalistic",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white.withAlpha(205),
                        fontFamily: fontMont,
                        fontSize: fontSizeHeading,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              MySpacing(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    final beforeEndHeight = size.height * 0.875;
    final startWidth = 0.0;
    final endWidth = size.width;
    final middleWidth = size.width / 2;
    final endHeight = size.height;

    path.moveTo(0, 0);
    path.lineTo(startWidth, beforeEndHeight);
    path.lineTo(middleWidth, endHeight);
    path.lineTo(endWidth, beforeEndHeight);
    path.lineTo(endWidth, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
