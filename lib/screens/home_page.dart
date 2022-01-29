import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/utils/theme.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool dark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (dark) {
          dark = false;
          Get.changeTheme(MyTheme.lightTheme);
        } else {
          dark = true;
          Get.changeTheme(MyTheme.darkTheme);
        }
      }),
      body: Center(
        child: Container(
            height: 100,
            width: 200,
            child: Card(
              elevation: 100,
              child: ListTile(
                title: Text("Workify"),
                subtitle: Text("Work-Life made Easy"),
              ),
            )),
      ),
      appBar: AppBar(
        title: Text("Hello Samarth"),
      ),
    );
  }
}
