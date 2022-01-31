import 'package:flutter/material.dart';
import 'package:workify/utils/sizes.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  RxBool isCollapsed = true.obs;
  @override
  Widget build(BuildContext context) {
    DeviceSize device = DeviceSize();
    device.size = MediaQuery.of(context).size;
    

    return Scaffold(
      body: Obx(()=>
      Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 800),
            curve: isCollapsed.value?Curves.fastLinearToSlowEaseIn:Curves.fastOutSlowIn,
            height: double.infinity,
            width:isCollapsed.value?DeviceSize().size.width/21:DeviceSize().size.width/7,
            child: MouseRegion(
              onEnter: (event) => isCollapsed.value=false,
              onExit: (event) => isCollapsed.value=true,
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
                  child: 
                      ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        color: Colors.white12,
                        child: buildHeader(isCollapsed.value),
                       
                      ),
                       Divider(color: Colors.white38,thickness: 2,),
                       ListTile()
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

  buildHeader(bool isCollapsed) {
    return FlutterLogo(
      size: 48,
    );
  }
}


