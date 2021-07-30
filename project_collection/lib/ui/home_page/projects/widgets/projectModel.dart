import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/ui/widgets/MySubHeading.dart';

import '../../../../style.dart';

class ProjectModel extends StatelessWidget {
  final double seperationWidth = 0.5;
  final List<Color> gradientColors;
  final String logoName;
  final Color? logoColor;
  final String projectName;
  final Color textColor;
  final List<String> technologies;
  final List<TextSpan> paragraphs;
  final List<ProjectIcon> projectIcons;
  final Color accentColor;
  final bool isLogoBorder;
  final Color logoBorderColor;

  ProjectModel({
    required this.gradientColors,
    // ignore: avoid_init_to_null
    this.logoColor = null,
    required this.logoName,
    required this.projectName,
    required this.textColor,
    required this.technologies,
    required this.paragraphs,
    required this.projectIcons,
    required this.accentColor,
    this.isLogoBorder = false,
    this.logoBorderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);

    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: projectHeightOffset * 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: gradientColors,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * seperationWidth,
              child: ProjectDetails(
                logoColor: logoColor,
                logoName: logoName,
                projectName: projectName,
                textColor: textColor,
                isLogoBorder: isLogoBorder,
                logoBorderColor: logoBorderColor,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width * (1.0 - seperationWidth),
                child: ProjectInfo(
                  technologies: technologies,
                  paragraphs: paragraphs,
                  projectIcons: projectIcons,
                  textColor: textColor,
                  accentColor: accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectDetails extends StatelessWidget {
  final String logoName;
  final Color? logoColor;
  final String projectName;
  final Color textColor;
  final bool isLogoBorder;
  final Color logoBorderColor;

  ProjectDetails({
    required this.logoColor,
    required this.logoName,
    required this.projectName,
    required this.textColor,
    required this.isLogoBorder,
    required this.logoBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MySpacing(
            height: 15,
          ),
          ProjectLogo(
            imageName: logoName,
            color: logoColor,
            isBorder: isLogoBorder,
            borderColor: logoBorderColor,
          ),
          MySpacing(
            height: 15,
          ),
          MySubHeading(
            heading: projectName,
            optionalTextStyle: TextStyle(
              fontFamily: fontPacifico,
              fontSize: fontSizeHeading * 3,
              color: textColor.withAlpha(200),
            ),
          ),
          MySpacing(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class ProjectLogo extends StatelessWidget {
  final String imageName;
  final Color? color;
  final bool isBorder;
  final Color borderColor;

  const ProjectLogo({
    required this.imageName,
    // ignore: avoid_init_to_null
    this.color = null,
    required this.isBorder,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      decoration: (isBorder)
          ? BoxDecoration(
              border: Border.all(
                color: borderColor,
                style: BorderStyle.solid,
                width: 2.5,
              ),
            )
          : null,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Image.asset(
        "images/" + imageName,
        color: color,
      ),
    );
  }
}

class ProjectInfo extends StatelessWidget {
  final List<String> technologies;
  final List<TextSpan> paragraphs;
  final List<ProjectIcon> projectIcons;
  final Color textColor;
  final Color accentColor;

  ProjectInfo({
    required this.technologies,
    required this.paragraphs,
    required this.projectIcons,
    required this.textColor,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: size.width * 0.5,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MySubHeading(
              heading: getTechnologiesSpacing(technologies),
              optionalTextStyle:
                  TextStyle(fontSize: fontSizeLarge * 1.5, color: accentColor),
            ),
            MySpacing(height: 15),
            Container(
              width: size.width * 0.3,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: paragraphTextStyle.copyWith(
                      fontSize: fontSizeLarge, color: textColor),
                  children: paragraphs,
                ),
              ),
            ),
            MySpacing(height: 25),
            Column(
              children: [
                MySubHeading(
                  heading: "Check it out!",
                  optionalTextStyle: TextStyle(
                      fontSize: fontSizeLarge * 1.1, color: accentColor),
                ),
                MySpacing(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: projectIcons,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    final double heightOffset = projectHeightOffset;
    final double width = size.width;
    final double height = size.height;

    //Top Curve
    path.moveTo(0, heightOffset);

    path.quadraticBezierTo(width / 4, 0, width / 2, heightOffset);

    path.quadraticBezierTo(width * 0.75, 2 * heightOffset, width, heightOffset);

    //Bottom Curve
    final heightOffsetBottom = height - heightOffset;

    path.lineTo(width, heightOffsetBottom);

    path.quadraticBezierTo(width * 0.75, height, width / 2, heightOffsetBottom);

    path.quadraticBezierTo(
        width / 4, height - 2 * heightOffset, 0, heightOffsetBottom);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ProjectIcon extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function onTap;

  ProjectIcon({required this.color, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Stack(
        children: [
          Positioned(
            bottom: -1,
            right: -1,
            child: Icon(
              icon,
              color: color.withAlpha(100),
              size: 60.0,
            ),
          ),
          Icon(
            icon,
            color: color,
            size: 60.0,
          ),
        ],
      ),
    );
  }
}

String getTechnologiesSpacing(List<String> listTech) {
  String ans = listTech[0];

  for (int i = 1; i < listTech.length; i++) {
    ans += "\n\n${listTech[i]}";
  }

  return ans;
}
