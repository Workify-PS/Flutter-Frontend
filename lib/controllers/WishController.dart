import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:workify/models/WishModel.dart';
import 'package:workify/services/wish_get_service.dart';

class WishController extends GetxController {
  RxList<WishModel> birthdayList =
      <WishModel>[WishModel(fullName: "Bday", empCode: "empCode")].obs;
  RxList<WishModel> anniversariesList =
      <WishModel>[WishModel(fullName: "anni", empCode: "empCode")].obs;
  RxList<WishModel> newJoinersList =
      <WishModel>[WishModel(fullName: "New Joiner", empCode: "empCode")].obs;
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() async {
    print("Initialized for Wish Controller");
    getAllEvents();
    super.onInit();
  }

  Future<void> getAllEvents() async {
    final wishGetService = WishGetService();
    final birthdays = await wishGetService.getBirthday();
    final anniversaries = await wishGetService.getBirthday();
    final newJoiners = await wishGetService.getBirthday();
    if (birthdays != null) {
      birthdayList.addAll(birthdays);
    }
    if (anniversaries != null) {
      anniversariesList.addAll(anniversaries);
    }
    if (newJoiners != null) {
      newJoinersList.addAll(newJoiners);
    }
    
  }

  void switchTabTo(int index) {
    selectedIndex.value = index;
    update();
  }

  RxList<WishModel>? getListAsPerIndex() {
    switch (selectedIndex.value) {
      case 0:
        return birthdayList;
      case 1:
        return anniversariesList;
      case 2:
        return newJoinersList;

      default:
        return null;
    }
  }
}
