import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:workify/components/button.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/utils/extensions.dart';

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
          ],
        ),
        SizedBox(height: 14),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Button(buttontext: 'OFFICE',),
        //     SizedBox(
        //       width: 30,
        //     ),
        //     Button(buttontext: 'REMOTE LOCATION'),
        //   ],
        // ),
        SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_circle_down_rounded,
                    color: Colors.blue,
                    size: 70,
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Punch IN Time'),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_circle_up_rounded,
                    color: Colors.blue,
                    size: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Punch OUT Time'),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
       
        SizedBox(
          height: 19,
        ),
        Spacer(),
        Button(buttontext: 'ATTENDANCE STATUS'),
        SizedBox(
          height: kDefaultPadding,
        ),
      ],
    );
  }
}
