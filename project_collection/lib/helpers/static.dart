import 'package:flutter/cupertino.dart';
import 'package:project_collection/ui/home_page/widgets/about/about.dart';

class StaticData {
  StaticData._privateConstructor();
  StaticData instance = StaticData._privateConstructor();

  static ScrollController scrollController = new ScrollController();

  static GlobalKey aboutKey = new GlobalKey();

  static GlobalKey projectsKey = new GlobalKey();

  static GlobalKey skillsKey = new GlobalKey();

  static GlobalKey contactKey = new GlobalKey();
}
