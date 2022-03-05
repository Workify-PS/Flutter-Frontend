import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/theme.dart';

class TasksIconWidget extends StatelessWidget {
  final int counter;
  const TasksIconWidget({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = counter < 10 ? 0 : 8;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 2),
          child: Icon(
            MyTheme().isDark(context)
                ? Icons.notifications
                : Icons.notifications_none_rounded,
            size: 28,
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                  color: kBadgeColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(64)),
              child: Text(
                counter.toString(),
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ))
      ],
    );
  }
}
