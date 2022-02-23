import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/WishController.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:workify/utils/constants.dart';
// import 'package:workify/utils/extensions.dart';

class WishCard extends StatefulWidget {
  const WishCard({
    Key? key,
  }) : super(key: key);

  @override
  State<WishCard> createState() => _WishCardState();
}

class _WishCardState extends State<WishCard> {
  String now = DateFormat("dd-MM-yyyy").format(DateTime.now());
  int _currentindex = 0;
  final tabs = [
    Center(child: Text('birthday')),
    Center(child: Text('anniversaries')),
    Center(child: Text('new joiners')),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.calendar_today_rounded, size: 20),
              Text(now, style: TextStyle(fontSize: 20)),
            ]),
          ),
          SizedBox(
            height: 245,
            child: Scaffold(
                body: tabs[_currentindex],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentindex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: kPrimaryColor,
                  unselectedItemColor: Colors.white60,
                  selectedItemColor: Colors.white,
                  selectedFontSize: 15.8,
                  unselectedFontSize: 14,
                  unselectedIconTheme: IconThemeData(opacity: 0, size: 0),
                  selectedIconTheme: IconThemeData(opacity: 0, size: 0),
                  items: [
                    menu(label: 'Birthdays'),
                    menu(label: 'Anniversaries'),
                    menu(label: 'New Joiners'),
                  ],
                  onTap: (index) {
                    setState(() {
                      _currentindex = index;
                    });
                  },
                )),
          ),
        ],
      ),
    );
  }

  menu({required String label}) {
    return BottomNavigationBarItem(label: label, icon: Icon(Icons.abc));
  }
}
