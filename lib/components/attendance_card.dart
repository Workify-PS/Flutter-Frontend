import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:workify/components/button.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 32,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(
              width: kDefaultPadding / 2,
            ),
            // Expanded(
            //     child: Text.rich(TextSpan(
            //   text: "Attendance",
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.w500,
            //     color: kTextColor,
            //   ),
            // ))),
          ],
        ),
        SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Button(buttontext: 'OFFICE'),
            SizedBox(
              width: 30,
            ),
            Button(buttontext: 'REMOTE LOCATION'),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_circle_down_rounded,
                color: Colors.blue,
                size: 70,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_circle_up_rounded,
                color: Colors.blue,
                size: 70,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text('Punch IN Time'), Text('Punch OUT Time')]),
        SizedBox(
          height: 19,
        ),
        Button(buttontext: 'ATTENDANCE STATUS'),
      ],
    );
  }
}
