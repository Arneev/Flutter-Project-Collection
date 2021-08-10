import 'package:flutter/material.dart';
import 'package:project_collection/helpers/static.dart';

void goToProjects(BuildContext context) {
  goToGeneral(StaticData.projectsKey);
}

void goToAbout(BuildContext context) {
  goToGeneral(StaticData.aboutKey);
}

void goToSkills(BuildContext context) {
  goToGeneral(StaticData.skillsKey);
}

void goToContact(BuildContext context) {
  goToGeneral(StaticData.contactKey);
}

void goToGeneral(GlobalKey key) {
  RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;

  Offset offset = renderBox.localToGlobal(Offset.zero);

  double y = offset.dy;

  StaticData.scrollController.animateTo(
    y,
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut,
  );
}
