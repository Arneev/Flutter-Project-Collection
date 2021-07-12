import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;

  MyScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: body,
      ),
    );
  }
}
