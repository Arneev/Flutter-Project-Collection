import 'package:flutter/material.dart';
import 'package:project_collection/helpers/static.dart';

import 'mobileDrawer.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;

  MyScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: (StaticData.globalSize.width < 860) ? MobileDrawer() : null,
      body: SingleChildScrollView(
        controller: StaticData.scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        child: body,
      ),
    );
  }
}
