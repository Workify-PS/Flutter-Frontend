import 'package:get/get.dart';
import 'package:workify/screens/ProfileSection/ProfileSectionControllers/profile_details_controller.dart';
import 'package:workify/screens/ProfileSection/ProfileSectionControllers/profile_widgets_controller.dart';

class ProfileSectionControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => ProfileDetailsController(),tag: 'ProfileDetailsController');
    Get.put(() => ProfileWidgetsController(),tag: 'ProfileWidgetsController');
  }
}

