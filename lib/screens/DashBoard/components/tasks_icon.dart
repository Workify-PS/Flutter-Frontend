import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';

class TasksIconWidget extends StatelessWidget {
  const TasksIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.notifications_none_rounded,
            size: 28,
          ),
          Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                  backgroundColor: kBadgeColor,
                  radius: 8,
                  
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Text(
                      '10',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  )))
        ],
      ),
    );
  }
}
