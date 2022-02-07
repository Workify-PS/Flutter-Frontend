import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';
import 'package:workify/utils/theme.dart';

class DashBoardCard extends StatefulWidget {
  final Widget child;
  final String? title;
  const DashBoardCard({Key? key, required this.child, this.title})
      : super(key: key);

  @override
  State<DashBoardCard> createState() => _DashBoardCardState();
}

class _DashBoardCardState extends State<DashBoardCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  if (widget.title != null)
                    Text(widget.title!,
                        style: Theme.of(context).textTheme.headline5),
                  Expanded(child: widget.child)
                ],
              ))
          .makeRounded(
              blurRadius: 15,
              borderRadius: 15,
              offset: Offset(5, 5),
              topShadowColor: MyTheme().isDark(context)
                  ? Color(0xff262C37).withOpacity(0.4)
                  : null,
              bottomShadowColor: MyTheme().isDark(context)
                  ? Color(0xff485063).withOpacity(0.6)
                  : null),
    );
  }
}
