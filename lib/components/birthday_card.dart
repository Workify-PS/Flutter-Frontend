import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workify/components/button.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';

class Birthdaycard extends StatefulWidget {
  const Birthdaycard({
    Key? key,
  }) : super(key: key);

  @override
  State<Birthdaycard> createState() => _BirthdaycardState();
}

class _BirthdaycardState extends State<Birthdaycard> {
  String now = DateFormat("dd-MM-yyyy").format(DateTime.now());
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
          color: kBgDarkColor,
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
                  text: "Wish",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: kTextColor,
                  ),
                ))),
              ],
            ),
            SizedBox(height: 28),
            RichText(
                text: TextSpan(children: [
              WidgetSpan(child: Icon(Icons.calendar_today_rounded, size: 20)),
              TextSpan(text: now, style: TextStyle(fontSize: 20)),
            ])),
            SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(buttontext: 'Birthdays'),
                Button(buttontext: 'Anniversaries'),
                Button(buttontext: 'New Joiners'),
              ],
            )
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
