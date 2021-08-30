import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/style.dart';

class MobileNavBarItem extends StatelessWidget {
  final String text;
  final Function onTap;

  MobileNavBarItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: HoverAnimatedContainer(
        curve: Curves.ease,
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black54,
        ),
        hoverDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white10,
        ),
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            onTap();
            Navigator.pop(context);
          },
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: fontMont,
              fontSize: fontSizeLarge,
            ),
          ),
        ),
      ),
    );
  }
}
