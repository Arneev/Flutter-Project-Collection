import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/style.dart';
import 'package:project_collection/ui/home_page/skills/helper/skills_data.dart';
import 'package:project_collection/ui/home_page/skills/skills_view_model.dart';
import 'package:project_collection/ui/widgets/MyBannerHeading.dart';
import 'package:stacked/stacked.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SkillsViewModel>.reactive(
      viewModelBuilder: () => SkillsViewModel(),
      builder: (
        BuildContext context,
        SkillsViewModel model,
        _,
      ) {
        final size = getSize(context);
        return Container(
          child: Column(
            children: [
              MySpacing(
                height: 25,
              ),
              MyBannerHeading(
                headingText: "Skills",
                color: Colors.blue[900]!.withAlpha(152),
              ),
              SkillsTable(),
            ],
          ),
        );
      },
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/blueCoral.png"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withAlpha(45), BlendMode.darken),
        ),
      ),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createSkillTable(context: context, numberPerRow: 3),
      ),
    );
  }
}

List<Widget> _createSkillTable(
    {required int numberPerRow, required BuildContext context}) {
  List<Widget> widgets = [];

  final size = getSize(context);

  final double sizeShrink = 0.8;

  double widthSize = (size.width * sizeShrink) / numberPerRow;

  Row tempRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [],
  );

  for (int i = 1; i <= allSkills.length; i++) {
    if (i % 3 != 0) {
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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "images/icons/$imageLoc",
            width: widthSize * imageScale,
            height: widthSize * imageScale,
          ),
          Container(
            alignment: Alignment.center,
            width: widthSize * 0.8,
            child: Expanded(
              child: SingleChildScrollView(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: paragraphTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
