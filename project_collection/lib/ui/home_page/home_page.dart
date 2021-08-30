import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/helpers/static.dart';
import 'package:project_collection/style.dart';
import 'package:project_collection/ui/home_page/contact/contact_options.dart';
import 'package:project_collection/ui/home_page/projects/projects.dart';
import 'package:project_collection/ui/home_page/skills/skills.dart';
import 'package:project_collection/ui/home_page/widgets/about/about.dart';
import 'package:project_collection/ui/home_page/widgets/header/header.dart';
import 'package:project_collection/ui/widgets/MyNavBar.dart';
import 'package:project_collection/ui/widgets/MyScaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    StaticData.globalSize = size;
    return MyScaffold(
      body: Container(
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // gradient: backgroundGradient,
          color: Colors.red[50],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //Header
            Header(),
            About(
              key: StaticData.aboutKey,
            ),
            // MySpacing(
            //   height: 10,
            // ),
            ColumnSuper(
              innerDistance: -columnOffset,
              invert: true,
              children: [
                Projects(
                  key: StaticData.projectsKey,
                ),
                Skills(
                  key: StaticData.skillsKey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
