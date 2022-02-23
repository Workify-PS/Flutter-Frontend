import 'package:get/get.dart';


class HomePageController extends GetxController {
  RxInt sideMenuIndex = 0.obs;

  void gotoPage(int index) {
    sideMenuIndex.value = index;
  }
}
