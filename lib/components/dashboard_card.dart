import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
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
    return Container(
        padding: EdgeInsets.only(top: kDefaultPadding ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              if (widget.title != null)

                Text(widget.title!.tr(), style: Theme.of(context).textTheme.headline5!

                    //.copyWith(backgroundColor: Colors.amberAccent)),
                    ),
              Expanded(child: widget.child)
            ],
          ),
        )).neuromorphism(
      context,
      blurRadius: 15,
      borderRadius: 15,
      offset: Offset(5, 5),
    );
  }
}
