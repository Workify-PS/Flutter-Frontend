import 'package:flutter/material.dart';
import 'package:workify/components/side_menu.dart';
import 'package:workify/controllers/user_controller.dart';
import 'package:workify/screens/DashBoard.dart';
// import 'package:workify/utils/constants.dart';
import 'package:workify/utils/sizes.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RxBool isCollapsed = true.obs;
  
  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldkey,
      //backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
      endDrawer: Drawer(),
      body: Row(
        children: [
          SizedBox(
            child: SideMenu(),
            width: 236,
          ),
          Container(
            width: 5,
            height: double.infinity,
            color: Colors.black12,
          ),
          Expanded(child: DashBoard(parentScaffoldkey: _scaffoldkey)),
        ],
      ),

      // Row(
      //   children: [
      //     Obx(() => AnimatedContainer(
      //           duration: Duration(milliseconds: 200),
      //           curve: isCollapsed.value ? Curves.linear : Curves.linear,
      //           height: double.infinity,
      //           width: isCollapsed.value ? 76 : 224,
      //           child: MouseRegion(
      //             onEnter: (event) => isCollapsed.value = false,
      //             onExit: (event) => isCollapsed.value = true,
      //             child: Material(
      //               elevation: 100,
      //               color: Theme.of(context).primaryColor,
      //               borderOnForeground: true,
      //               type: MaterialType.card,
      //               shadowColor: Colors.black,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.only(
      //                       topRight: Radius.circular(6),
      //                       bottomRight: Radius.circular(6))),
      //               child: ListView(
      //                 children: [
      //                   Container(
      //                     padding: EdgeInsets.symmetric(vertical: 24),
      //                     height: bannerHeight,
      //                     decoration: BoxDecoration(
      //                         border: Border.fromBorderSide(
      //                             BorderSide(color: Colors.black12))),
      //                     child: buildHeader(),
      //                   ),
      //                   // Divider(
      //                   //   color: kScaffoldColor,
      //                   //   thickness: 1,
      //                   // ),
      //                   buildTiles()
      //                 ],
      //               ),
      //             ),
      //           ),
      //         )),
      //     const SizedBox(
      //       width: 6,
      //     ),
      //     DashBoard(),
      //   ],
      // ),
    );
  }

  buildHeader() {
    return FlutterLogo(
      size: 36,
    );
  }

  // buildTiles() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: List.generate(
  //         titles.length,
  //         (index) => DrawerItem(
  //             isCollapsed: isCollapsed.value,
  //             icon: icons[index],
  //             title: titles[index])),
  //   );
  // }
}
