import 'dart:math';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:workify/models/WishModel.dart';
import 'package:workify/services/wish_get_service.dart';

class WishController extends GetxController {
  RxList<WishModel>? birthdayList;
  RxList<WishModel>? anniversariesList;
  RxList<WishModel>? newJoinersList;

  @override
  void onInit() async {
    getLists();
  }

  Future<void> getLists() async {
    final wishGetService = WishGetService();
    final birthdays = await wishGetService.getBirthday();
    final anniversaries = await wishGetService.getBirthday();
    final newJoiners = await wishGetService.getBirthday();
    if (birthdays != null) {
      birthdayList = RxList<WishModel>(birthdays);
    }
    if (anniversaries != null) {
      anniversariesList = RxList<WishModel>(anniversaries);
    }
    if (newJoiners != null) {
      newJoinersList = RxList<WishModel>(newJoiners);
    }
  }
}
