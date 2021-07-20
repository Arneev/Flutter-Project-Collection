import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';

import '../../../../style.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return ClipPath(
      clipper: _MyClipper(),
      child: Container(
        width: size.width,
        height: size.height * aboutHeight,
        decoration: BoxDecoration(
          color: Colors.purple[100]!.withAlpha(224),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(75),
            bottomRight: Radius.circular(75),
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySpacing(
              height: 15,
            ),
            _ProfilePicture(),
            MySpacing(
              height: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _CleanText(
                    text: "Arneev Mohan Singh",
                  ),
                  _CleanText(
                    text: "Durban, South Africa",
                  ),
                  _CleanText(
                    text: "20 Years Old",
                  ),
                ],
              ),
            ),
            MySpacing(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class _CleanText extends StatelessWidget {
  final String text;
  const _CleanText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontMont,
        fontSize: fontSizeLarge,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.3,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("images/selfie.png"),
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3.75,
        ),
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    final widgthFull = size.width;
    final heightFull = size.height;

    final widthOffset = size.width / 16;

    //Go around the Widget
    path.moveTo(0, heightFull);
    path.lineTo(widgthFull, heightFull);
    path.lineTo(widgthFull, 0);
    path.lineTo(0, 0);

    //Wavey Pattern
    path.quadraticBezierTo(widthOffset + -widthOffset, heightFull / 4,
        widthOffset, heightFull / 2);

    path.quadraticBezierTo(
        widthOffset + widthOffset, 0.75 * heightFull, widthOffset, heightFull);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
