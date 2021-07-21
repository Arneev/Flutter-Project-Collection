import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/style.dart';
import 'package:project_collection/ui/home_page/projects/projects.viewmodel.dart';
import 'package:project_collection/ui/widgets/MySubHeading.dart';
import 'package:stacked/stacked.dart';
import 'package:project_collection/ui/widgets/MyBannerHeading.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProjectsViewModel>.nonReactive(
      viewModelBuilder: () => ProjectsViewModel(),
      builder: (
        BuildContext context,
        ProjectsViewModel model,
        _,
      ) {
        final size = getSize(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            MyBannerHeading(headingText: "Projects"),
            MySpacing(),
            ProjectModel(),
          ],
        );
      },
    );
  }
}

class ProjectModel extends StatelessWidget {
  final int seperationWidth = 40;

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);

    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: projectHeightOffset),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                grey.withAlpha(40),
                purple.withAlpha(238),
              ]),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 100 - seperationWidth,
              child: ProjectInfo(),
            ),
            Expanded(
              flex: seperationWidth,
              child: ProjectDetails(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      height: 500,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MySpacing(
            height: 15,
          ),
          ProjectLogo(
            imageName: "lifePlum.png",
          ),
          MySpacing(
            height: 15,
          ),
          MySubHeading(
            heading: "Life Plum",
            optionalTextStyle: TextStyle(
              fontFamily: fontPacifico,
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
  const ProjectLogo({Key? key, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Align(
      alignment: Alignment.center,
      heightFactor: 0.2,
      child: Image.asset("images/" + imageName),
    );
  }
}

class ProjectInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      height: 500,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [],
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
