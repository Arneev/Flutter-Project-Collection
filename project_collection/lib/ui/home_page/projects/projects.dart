import 'dart:html';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/style.dart';
import 'package:project_collection/ui/home_page/projects/widgets/projectModel.dart';
import 'package:project_collection/ui/widgets/MyBannerHeading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_color/flutter_color.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return ColumnSuper(
      // key: this.widget.key,
      innerDistance: -columnOffset,
      children: [
        MyBannerHeading(
          headingText: "Projects",
          color: Colors.purple.withAlpha(64),
          padding: EdgeInsets.only(top: 5, bottom: columnOffset / 2),
        ),
        LifePlumProject(),
        DayStarterProject(),
        CubinoProject(),
        PlaterProject(),
        FinanceManagerProject(),
        LecTracProject(),
        LNBProject(),
        CategoraProject(),
      ],
    );
  }
}

// ignore: non_constant_identifier_names
Widget LifePlumProject() {
  return ProjectModel(
    logoParentWidget: (Widget child) => RotateLifePlum(
      child: child,
    ),
    accentColor: Colors.white,
    gradientColors: [
      purple.mix(Colors.white, 0.4)!,
      purple.mix(Colors.white, 0.2)!,
    ],
    logoColor: Colors.white,
    logoName: "lifePlum.png",
    projectName: "Life Plum",
    textColor: Colors.white,
    technologies: [
      "Flutter",
      "Dart",
      "SQLite",
    ],
    paragraphs: <TextSpan>[
      TextSpan(
        text:
            "Check the weather, plan your day, monitor your happiness, journal down each day.",
      ),
      TextSpan(
        text: "\n\nThe perfect day-starter.",
      ),
      TextSpan(
        text:
            "\n\nA fun project I made in order to start my day off with. Meant to encourage myself to journal and plan my day out more.",
      ),
    ],
    projectIcons: <ProjectIcon>[
      ProjectIcon(
        color: Colors.white,
        icon: playstoreIcon,
        onTap: () => launch(
            "https://play.google.com/store/apps/details?id=com.leemeodev.life_plum"),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget CategoraProject() {
  return ProjectModel(
    logoParentWidget: (Widget child) => RotateCategora(
      child: child,
    ),
    accentColor: brightRed,
    gradientColors: [
      darkNavyBlue,
      darkNavyBlue,
    ],
    logoColor: null,
    logoName: "categora.png",
    projectName: "Categora",
    textColor: mustard,
    technologies: [
      "Flutter",
      "Dart",
      "Firebase",
    ],
    paragraphs: <TextSpan>[
      TextSpan(
        text:
            '''Add any Category (Shopping List) and add any items that fall under that Category (Milk, Eggs).
\n\nSet up Due Dates for them and mark them based off priority.''',
      ),
      TextSpan(
        text: "\n\nOrganize your tasks!",
      ),
      TextSpan(
        text:
            "\n\nI wanted to keep track of the tasks I had to do, groceries I had to buy, and more. Categora uses an online database therefore I don't have the risk of losing my categories :)",
      ),
    ],
    projectIcons: <ProjectIcon>[
      ProjectIcon(
        color: mustard,
        icon: playstoreIcon,
        onTap: () => launch(
            "https://play.google.com/store/apps/details?id=com.leemeodev.categora"),
      ),
      ProjectIcon(
        color: mustard,
        icon: webIcon,
        onTap: () => launch("https://categora-ae98e.web.app/"),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget CubinoProject() {
  return ProjectModel(
    logoParentWidget: (Widget child) => Container(
      child: child,
    ),
    accentColor: brightRed,
    gradientColors: [
      darkCubinoGrey,
      cubinoGrey,
    ],
    logoColor: null,
    logoName: "cubino.png",
    projectName: "Cubino",
    textColor: Colors.white,
    isLogoBorder: true,
    logoBorderColor: brightRed.withAlpha(128),
    technologies: [
      "Unity",
      "C#",
    ],
    paragraphs: <TextSpan>[
      TextSpan(
        text:
            '''Reach the finish line as you zip past obstacles and dodge enemies.\nJump, Shrink, Shoot, Slow Time.\n\n
          Do whatever you can in order to reach your goal!''',
      ),
      TextSpan(
        text: "\n\nMy first ever ",
      ),
      TextSpan(
        style: TextStyle(fontWeight: FontWeight.bold),
        text: "BIG",
      ),
      TextSpan(
        text: " project that I made.",
      ),
    ],
    projectIcons: <ProjectIcon>[
      ProjectIcon(
        color: brightRed,
        icon: playstoreIcon,
        onTap: () => launch(
            "https://play.google.com/store/apps/details?id=com.arneevsingh.cubino"),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget DayStarterProject() {
  return ProjectModel(
    logoParentWidget: (Widget child) => Container(
      child: child,
    ),
    accentColor: dayStarterYellow,
    gradientColors: [
      dayStarterDarkGreen.withAlpha(156),
      dayStarterDarkGreen.withAlpha(192),
    ],
    logoColor: null,
    logoName: "dayBoost.png",
    projectName: "Day Boost",
    textColor: Colors.white,
    technologies: [
      "React",
      "JS",
      "Bootstrap",
      "Firebase",
    ],
    paragraphs: <TextSpan>[
      TextSpan(
        text:
            '''Add any links you start up in the morning, click on the boost button and open them all at once.''',
      ),
      TextSpan(
        text: "\n\nBoost your Day!",
      ),
      TextSpan(
        text:
            "\n\nMostly meant to be a learning project for React and Bootstrap.",
      ),
    ],
    projectIcons: <ProjectIcon>[
      ProjectIcon(
        color: dayStarterYellow,
        icon: webIcon,
        onTap: () => launch("https://day-boost.firebaseapp.com/"),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget FinanceManagerProject() {
  return ProjectModel(
    logoParentWidget: (Widget child) => Container(
      child: child,
    ),
    accentColor: Colors.white.withBlue(192),
    gradientColors: [
      brightRed.withAlpha(192),
      Colors.red[900]!.withAlpha(156),
    ],
    logoColor: null,
    logoName: "financeManager.png",
    projectName: "Finance Manager",
    textColor: Colors.white,
    technologies: [
      "RAD Studio",
      "Delphi",
    ],
    paragraphs: <TextSpan>[
      TextSpan(
        text:
            '''Add any expenses or income, either to your card or cash. Categorize expenses, monitor your finances, view it on graphs.''',
      ),
      TextSpan(
        text: "\n\nKeep up with your Finances!",
      ),
      TextSpan(
        text: "\n\nMy first ever project created in High School.",
      ),
    ],
    isLogoBorder: true,
    logoBorderColor: Colors.white.withAlpha(128),
    projectIcons: <ProjectIcon>[
      ProjectIcon(
        color: Colors.white,
        icon: driveIcon,
        onTap: () => launch(
            "https://drive.google.com/drive/folders/1Q0s6-z6NQlT3tHpFPfdc9kDq9lenq8fb?usp=sharing"),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget LecTracProject() {
  return ProjectModel(
    logoParentWidget: (Widget child) => Container(
      child: child,
    ),
    accentColor: accentPink,
    gradientColors: [
      purpleBlue,
      brightPink,
    ],
    logoColor: null,
    logoName: "lectrac.png",
    projectName: "LecTrac",
    textColor: Colors.white,
    technologies: [
      "Android Studio",
      "Java",
      "SQLite",
    ],
    paragraphs: <TextSpan>[
      TextSpan(
        text:
            '''University To-Do App, meant for lecturers to add tasks, where students can check the tasks they need to do.
             Add personal tasks. Check your tasks on a Calendar. Receive any updates from Lecturers.''',
      ),
      TextSpan(
        text: "\n\nKeep up with Uni Life!",
      ),
      TextSpan(
        text:
            "\n\nMy first project created with a team! This is all hypothetical as it was a uni project and we did not have access to the students' data.",
      ),
    ],
    isLogoBorder: true,
    logoBorderColor: Colors.white.withAlpha(128),
    projectIcons: <ProjectIcon>[
      ProjectIcon(
        color: Colors.white,
        icon: dropBoxIcon,
        onTap: () => launch(
            "https://www.dropbox.com/sh/1tyjwblh8cac62q/AAAvFg7adMXRFi9XuIGSxTcOa?dl=0"),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget PlaterProject() {
  return ProjectModel(
    logoParentWidget: (Widget child) => Container(
      child: child,
    ),
    accentColor: Colors.white.withAlpha(192),
    gradientColors: [
      Colors.brown[300]!,
      Colors.amber[900]!.withAlpha(164),
    ],
    logoColor: null,
    logoName: "platter.png",
    projectName: "Platter",
    textColor: Colors.white,
    technologies: [
      "HTML",
      "JS",
      "SCSS",
    ],
    paragraphs: <TextSpan>[
      TextSpan(
        text:
            '''Find out how to make your favourite meals! Explore new cusines and get step-by-step instructions.''',
      ),
      TextSpan(
        text: "\n\nLess Work, More Food.",
      ),
      TextSpan(
        text: "\n\nTried to make a website the Vanilla way.",
      ),
    ],
    isLogoBorder: true,
    logoBorderColor: Colors.black.withAlpha(32),
    projectIcons: <ProjectIcon>[
      ProjectIcon(
        color: Colors.white,
        icon: webIcon,
        onTap: () => launch("http://www.platter.c1.biz"),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget LNBProject() {
  return ProjectModel(
    logoParentWidget: (Widget child) => Container(
      child: child,
    ),
    accentColor: Colors.grey[800]!,
    gradientColors: [
      Colors.teal,
      Color(0xFFffa781),
    ],
    logoColor: null,
    logoName: "lnb.png",
    projectName: "Last National Bank",
    textColor: Colors.white,
    technologies: [
      "Flutter",
      "MySQL",
      "PHP",
    ],
    paragraphs: <TextSpan>[
      TextSpan(
        text: '''Like your banking app but, better!\n\nJust kidding.''',
      ),
      TextSpan(
        text: "\n\nKeep track of your finances, bank with LNB.",
      ),
      TextSpan(
        text:
            "\n\nA group project with 8 team members. Our team, Execution Empire, decided to make a banking as our final year project. Create different accounts, transfer amongst them and other LNB Bankers. Monitor your timeline and get PDF Statements!",
      ),
    ],
    projectIcons: <ProjectIcon>[
      ProjectIcon(
        color: Colors.white,
        icon: webIcon,
        onTap: () => launch("https://execution-empire.co.za"),
      ),
    ],
  );
}

//Rotations
class RotateLifePlum extends StatefulWidget {
  final Widget child;

  RotateLifePlum({required this.child});

  @override
  _RotateLifePlumState createState() => _RotateLifePlumState();
}

class _RotateLifePlumState extends State<RotateLifePlum>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.widget.child,
    );
  }
}

class RotateCategora extends StatefulWidget {
  final Widget child;

  RotateCategora({required this.child});

  @override
  RotateCategoraState createState() => RotateCategoraState();
}

class RotateCategoraState extends State<RotateCategora>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 20))
        ..repeat();

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.linear);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: this.widget.child,
    );
  }
}

/*
class _RotatingLogo extends StatefulWidget {
  @override
  __RotatingLogoState createState() => __RotatingLogoState();
}

class __RotatingLogoState extends State<_RotatingLogo>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 20))
        ..repeat();

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.linear);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: TransparentLogo(),
    );
  }
}

*/
