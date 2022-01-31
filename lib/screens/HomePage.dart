import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RxBool isCollapsed = true.obs;
  final titles = ["DashBoard", "Attendance", "Profile", "Settings"];
  final icons = [Icons.dashboard, Icons.list_alt, Icons.person, Icons.settings];

  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;

    return Scaffold(
        body: Obx(
      () => Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            curve: isCollapsed.value
                ? Curves.linear
                : Curves.linear,
            height: double.infinity,
            width: isCollapsed.value
                ? DeviceSize().size.width / 21
                : DeviceSize().size.width / 7,
            child: MouseRegion(
              onEnter: (event) => isCollapsed.value = false,
              onExit: (event) => isCollapsed.value = true,
              child: Material(
                elevation: 100,
                color: Theme.of(context).primaryColor,
                borderOnForeground: true,
                type: MaterialType.card,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6))),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      color: Colors.white12,
                      child: buildHeader(),
                    ),
                    Divider(
                      color: Colors.white38,
                      thickness: 2,
                    ),
                    buildTiles()
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
          ),
        ],
      ),
    ));
  }

  buildHeader() {
    return FlutterLogo(
      size: 36,
    );
  }

  buildTiles() {
    return Column(
      children: List.generate(
          titles.length,
          (index) => Container(
            height: 50,
            width: 50,
            child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    icons[index],
                    size: 24,
                  ),
                  title: isCollapsed.value ? Container() : Text(titles[index]),
                ),
          )),
    );
  }
}
