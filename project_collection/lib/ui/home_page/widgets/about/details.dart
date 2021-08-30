import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/ui/home_page/projects/widgets/projectModel.dart';

import '../../../../style.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    bool isPhone = (size.width < phoneWidth);
    return Container(
      width: size.width,
      child: ClipPath(
        clipper: _MyClipper(isPhone),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.purple[100]!.withAlpha(224),
          ),
          alignment: Alignment.center,
          padding: (!isPhone)
              ? EdgeInsets.symmetric(
                  vertical: 30, horizontal: size.width * 0.1 * 0.5)
              : EdgeInsets.only(top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: (!isPhone) ? MainAxisSize.max : MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MySpacing(
                height: 30,
              ),

              _ProfilePicture(isPhone),
              MySpacing(
                height: 15,
              ),
              //Desktop Layout
              (!isPhone)
                  ? Expanded(
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
                    )
                  //Phone Layout
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MySpacing(
                          height: 10,
                        ),
                        _CleanText(
                          text: "Arneev Mohan Singh",
                        ),
                        MySpacing(
                          height: 5,
                        ),
                        _CleanText(
                          text: "Durban, South Africa",
                        ),
                        MySpacing(
                          height: 5,
                        ),
                        _CleanText(
                          text: "20 Years Old",
                        ),
                      ],
                    ),
              MySpacing(
                height: size.height * 0.05,
              ),
            ],
          ),
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontMont,
          fontSize: fontSizeLarge,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  bool isPhone;
  _ProfilePicture(this.isPhone);
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);

    return Container(
      width: (!isPhone) ? size.width * 0.3 : size.width * 0.5,
      height: (!isPhone) ? size.height * 0.3 : size.width * 0.5,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("images/selfie.jpg"),
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
  late final bool isPhone;

  _MyClipper(this.isPhone);

  @override
  Path getClip(Size size) {
    if (!isPhone) {
      Path path = new Path();

      final widthFull = size.width;
      final heightFull = size.height;

      final widthOffset = size.width / 16;

      //Go around the Widget
      path.moveTo(0, heightFull);
      path.lineTo(widthFull, heightFull);
      path.lineTo(widthFull, 0);
      path.lineTo(0, 0);

      //Wavey Pattern
      path.quadraticBezierTo(widthOffset + -widthOffset, heightFull / 4,
          widthOffset, heightFull / 2);

      path.quadraticBezierTo(widthOffset + widthOffset, 0.75 * heightFull,
          widthOffset, heightFull);

      path.close();

      return path;
    } else {
      Path path = new Path();

      final widthFull = size.width;
      final heightFull = size.height;

      final heightOffset = 10;

      path.moveTo(0, heightFull - heightOffset);

      path.quadraticBezierTo(
        widthFull / 4,
        heightFull * 0.9 - heightOffset,
        widthFull / 2,
        heightFull - heightOffset,
      );

      path.quadraticBezierTo(
        3 * widthFull / 4,
        heightFull * 0.9 - heightOffset,
        widthFull,
        heightFull - heightOffset,
      );

      path.lineTo(widthFull, 0);
      path.lineTo(0, 0);
      path.close();

      return path;
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
