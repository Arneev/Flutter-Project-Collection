import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/helpers/static.dart';
import 'package:project_collection/ui/widgets/MyBannerHeading.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../style.dart';

class ContactOptions extends StatefulWidget {
  const ContactOptions({Key? key}) : super(key: key);

  @override
  _ContactOptionsState createState() => _ContactOptionsState();
}

class _ContactOptionsState extends State<ContactOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: StaticData.contactKey,
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          ContactBlock(
              imageName: "github", goTo: "https://www.github.com/Arneev"),
          ContactBlock(
              imageName: "linkedin",
              goTo: "https://www.linkedin.com/in/arneev-singh/"),
          ContactBlock(imageName: "email", goTo: "mailto:arneevso@gmail.com"),
          ContactBlock(imageName: "phone", goTo: "tel:+27614797043"),
        ],
      ),
    );
  }
}

class ContactBlock extends StatelessWidget {
  final String imageName;
  final String goTo;

  ContactBlock({required this.imageName, required this.goTo});

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return HoverAnimatedContainer(
      curve: Curves.linear,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      hoverDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white10,
      ),
      width: size.width * 0.15,
      child: GestureDetector(
        onTap: () {
          launch(goTo);
        },
        child: Image.asset("images/contact/$imageName.png"),
      ),
    );
  }
}
