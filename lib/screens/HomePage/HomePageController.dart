import 'package:get/get.dart';
import 'package:workify/controllers/WishController.dart';

class HomePageController extends GetxController {
  RxInt sideMenuIndex = 0.obs;
  @override
  void onInit() {
    Get.put(WishController());
    super.onInit();
  }

  void gotoPage(int index) {
    sideMenuIndex.value = index;
  }
}
