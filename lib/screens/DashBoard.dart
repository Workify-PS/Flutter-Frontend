import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workify/components/DashBoardCard.dart';
import 'package:workify/components/SideMenu.dart';
import 'package:workify/models/Email.dart';
import 'package:workify/utils/constants.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Container(
        //padding: EdgeInsets.only(top: bannerHeight),
        color: kBgDarkColor,
        child: Column(
          children: [
            SizedBox(
              height: bannerHeight,
              child: Container(
                color: Colors.black12,
              ),
            ),
            Expanded(
              child: GridView.builder(
                //shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => DashBoardCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
