import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/controllers/UserController.dart';
import 'package:workify/mixins/cache.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class TopBar extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldkey;
  final Widget? customTopBar;
  final String title;
  const TopBar({
    Key? key,
    this.customTopBar,
    this.parentScaffoldkey,
    required this.title,
  }) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with CacheManager {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      borderOnForeground: true,
      child: Container(
        height: bannerHeight,
        padding: const EdgeInsets.only(left: 36, right: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.customTopBar ??
                Text(widget.title,
                    style: Theme.of(context).primaryTextTheme.headline1),
          ],
        ),
      ),
    );
  }
}
