import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workify/components/button.dart';
import 'package:workify/controllers/date_controller.dart';

class Date extends StatelessWidget {
  Date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateController = Get.put(DateController());

    var today = DateTime.now().toString().split(' ');
    var onlydate = today[0];

    final dayController = TextEditingController(text: onlydate.substring(8));
    final monthController =
        TextEditingController(text: onlydate.substring(5, 7));
    final yearController =
        TextEditingController(text: onlydate.substring(0, 4));
    
    var date = yearController.text +
      '-' +
      monthController.text +
      '-' +
      dayController.text;
  dateController.updateDate(date);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextField(
                controller: dayController,
                decoration: InputDecoration(
                  label: Text('Day'),
                  hintText: dayController.text,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: TextField(
                controller: monthController,
                decoration: InputDecoration(
                  label: Text('Month'),
                  hintText: monthController.text,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: TextField(
                controller: yearController,
                decoration: InputDecoration(
                  label: Text('Year'),
                  hintText: yearController.text,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
