import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:workify/models/WishModel.dart';
import 'package:workify/services/wish_get_service.dart';

class WishController extends GetxController {
  RxList<WishModel> birthdayList = <WishModel>[].obs;
  RxList<WishModel> anniversariesList = <WishModel>[].obs;
  RxList<WishModel> newJoinersList = <WishModel>[].obs;
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
    final anniversaries = await wishGetService.getAnniversary();
    final newJoiners = await wishGetService.getNewjoiners();
    if (birthdays != null) {
      birthdayList.addAll(birthdays);
    }
    if (anniversaries != null) {
      anniversariesList.addAll(anniversaries);
    }
    if (newJoiners != null) {
      newJoinersList.addAll(newJoiners);
    }
    birthdayList.forEach((element) {
      print(element.fullName);
    });
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
        return birthdayList;

      default:
        return null;
    }
  }
}
