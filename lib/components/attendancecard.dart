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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: kBgDarkColor ,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
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
                Expanded(
                    child: Text.rich(TextSpan(
                  text: "Attendance",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: kTextColor,
                  ),
                ))),
              ],
            ),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(buttontext: 'OFFICE'),
                SizedBox(
                  width: 50,
                ),
                Button(buttontext: 'REMOTE LOCATION'),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_circle_down_rounded,
                    color: Colors.blue,
                    size: 140,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_circle_up_rounded,
                    color: Colors.blue,
                    size: 140,
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
        ),
      ).makeRounded(
        blurRadius: 15,
        borderRadius: 15,
        offset: Offset(5, 5),
        topShadowColor: Colors.white60,
        bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
      ),
    );
  }
}
