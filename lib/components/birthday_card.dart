import 'package:flutter/material.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';

class Birthdaycard extends StatelessWidget {
  const Birthdaycard({
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
            GetDate(),
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

class GetDate extends StatefulWidget {
  const GetDate({Key? key}) : super(key: key);

  State<GetDate> createState() => _GetDateState();
}

class _GetDateState extends State<GetDate> {
  String finalDate = '';
  getCurrentDate() {
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    setState(() {
      finalDate = formattedDate.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "date=$finalDate",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ));
  }
}
