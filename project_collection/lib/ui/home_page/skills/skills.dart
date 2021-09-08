import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/helpers/static.dart';
import 'package:project_collection/style.dart';
import 'package:project_collection/ui/home_page/contact/contact_options.dart';
import 'package:project_collection/ui/home_page/skills/helper/skills_data.dart';
import 'package:project_collection/ui/widgets/MyBannerHeading.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      // key: StaticData.skillsKey,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/blueCoral.png"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withAlpha(45), BlendMode.darken),
        ),
      ),
      child: Column(
        children: [
          MySpacing(
            height: 25,
          ),
          SkillsTable(),
          ContactOptions(),
        ],
      ),
    );
  }
}

class SkillsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
      alignment: Alignment.center,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createSkillTable(
            context: context,
            numberPerRow: getNumberRows(size.width),
            shrinkSize: getShrinkSize(size.width)),
      ),
    );
  }
}

int getNumberRows(double width) {
  if (width < phoneWidth) {
    return 1;
  } else if (width < tabletWidth) {
    return 2;
  }
  return 3;
}

double getShrinkSize(double width) {
  if (width < phoneWidth) {
    return 0.5;
  } else if (width < tabletWidth) {
    return 0.65;
  }

  return 0.8;
}

List<Widget> _createSkillTable(
    {required int numberPerRow,
    required BuildContext context,
    required double shrinkSize}) {
  List<Widget> widgets = [];

  final size = getSize(context);

  final double sizeShrink = shrinkSize;

  double widthSize = (size.width * sizeShrink) / numberPerRow;

  Row tempRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [],
  );

  for (int i = 1; i <= allSkills.length; i++) {
    if (i % numberPerRow != 0) {
      tempRow.children.add(
        SkillCube(
            imageLoc: allSkills[i - 1].imageName,
            text: allSkills[i - 1].text,
            widthSize: widthSize),
      );
    } else {
      tempRow.children.add(
        SkillCube(
            imageLoc: allSkills[i - 1].imageName,
            text: allSkills[i - 1].text,
            widthSize: widthSize),
      );
      widgets.add(tempRow);
      tempRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      );
    }
  }

  return widgets;
}

class SkillCube extends StatelessWidget {
  final String imageLoc;
  final String text;
  final double widthSize;

  SkillCube(
      {required this.imageLoc, required this.text, required this.widthSize});

  final double imageScale = 0.3;

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(30),
      ),
      width: widthSize,
      height: widthSize,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "images/icons/$imageLoc",
            isAntiAlias: true,
            width: widthSize * imageScale,
            height: widthSize * imageScale,
          ),
          // MySpacing(
          //   height: widthSize * 0.025,
          // ),
          // Expanded(
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                text,
                textAlign: TextAlign.start,
                style: paragraphTextStyle,
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
