import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workify/models/Email.dart';
import 'package:workify/utils/constants.dart';
import 'package:workify/utils/extensions.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({
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
                        text: "My Profile",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kTextColor,
                        ),
                        children: [
                      TextSpan(
                          text: '    <email@address>',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: kTextColor,
                                  ))
                    ]))),
              ],
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Text(
              "<CONTENT>",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    height: 1.5,
                  ),
            ),
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
