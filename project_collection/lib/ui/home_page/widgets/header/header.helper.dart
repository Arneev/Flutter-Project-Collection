import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_collection/helpers/helper.dart';

class ImageRotater extends StatefulWidget {
  final Widget child;

  ImageRotater({required this.child});

  @override
  _ImageRotaterState createState() => _ImageRotaterState();
}

class _ImageRotaterState extends State<ImageRotater>
    with TickerProviderStateMixin {
  late final subtree;

  static List<String> imageNames = [
    "1.png",
    "4.png",
    "7.png",
    "9.png",
    "10.png",
    "11.png",
    "14.png",
    "15.png",
  ];

  static List<AssetImage> images = imageNames
      .map((imgName) => AssetImage(
            "images/" + imgName,
          ))
      .toList();

  int _pos = 0;

  late AnimationController _animationController;

  @override
  void initState() {
    subtree = this.widget.child;

    //Setting up Animation

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      upperBound: 255.0,
      lowerBound: 0.0,
      value: 255.0,
    );

    Tween<double>(begin: 0.0, end: 255.0).animate(_animationController);

    _animationController.reverse();

    //Setting up Timer for Casaroul
    Timer.periodic(Duration(seconds: 10), (timer) async {
      _animationController.forward();

      await Future.delayed(Duration(milliseconds: 3000)).then((_) {
        setState(() {
          _pos = (_pos + 1) % imageNames.length;
        });
        _animationController.reverse();
      });
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero).then((_) {
      for (AssetImage assetImage in images) {
        precacheImage(assetImage, context);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, _) {
          return Container(
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: images[_pos],
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha(_animationController.value.toInt()),
                  BlendMode.multiply,
                ),
              ),
            ),
            child: subtree,
          );
        });
  }
}
