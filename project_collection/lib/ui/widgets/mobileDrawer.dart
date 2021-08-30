import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/helpers/navigation_helper.dart';
import 'package:project_collection/style.dart';

import 'MobileNavBarItem.dart';
import 'myNavBarItem.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return Container(
      width: size.width * 0.5,
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.black45,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: size.width * 0.5 * 0.5,
            height: size.width * 0.5 * 0.5,
            child: Image.asset("images/webIconTrans.png"),
          ),
          MobileNavBarItem(text: "About", onTap: () => goToAbout(context)),
          MobileNavBarItem(
              text: "Projects", onTap: () => goToProjects(context)),
          MobileNavBarItem(text: "Skills", onTap: () => goToSkills(context)),
          MobileNavBarItem(text: "Contact", onTap: () => goToContact(context)),
        ],
      ),
    );
  }
}
