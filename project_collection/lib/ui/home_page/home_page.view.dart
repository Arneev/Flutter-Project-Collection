import 'package:flutter/material.dart';
import 'package:project_collection/helpers/helper.dart';
import 'package:project_collection/style.dart';
import 'package:project_collection/ui/home_page/widgets/header.dart';
import 'package:project_collection/ui/widgets/MyNavBar.dart';
import 'package:project_collection/ui/widgets/MyScaffold.dart';
import 'package:stacked/stacked.dart';

import 'home_page.viewmodel.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.nonReactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (
        BuildContext context,
        HomePageViewModel model,
        _,
      ) {
        final size = getSize(context);
        return MyScaffold(
          body: Container(
            width: size.width,
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                //Header
                Header(),
              ],
            ),
          ),
        );
      },
    );
  }
}
