import 'package:get/get.dart';
// import 'package:workify/screens/ProfileSection/ProfileSectionControllers/profile_details_controller.dart';

class ProfileWidgetsController extends GetxController {
  RxString widgetString = 'Basic Details'.obs;
  RxString modifyProfileWidgetString = 'Modify Basic Details'.obs;

  updateWidgetString(String str) {
    widgetString(str);
  }

  RxBool basicButton = true.obs;
  RxBool positionButton = false.obs;
  RxBool employmentButton = false.obs;
  RxBool modifyButton = false.obs;

  resetButtons() {
    basicButton(false);
    positionButton(false);
    employmentButton(false);
    modifyButton(false);
  }

  setButton({
    required String str,
  }) {
    if (str == 'Basic Details') {
      basicButton(true);
    } else if (str == 'Position Details') {
      positionButton(true);
    } else if (str == 'Employment Details') {
      employmentButton(true);
    } else if (str == 'Modify Profile Details') {
      modifyButton(true);
    }
  }

  updateModifyProfileWidgetString(String str) {
    modifyProfileWidgetString(str);
  }


  RxBool modifyBasicButton = true.obs;
  RxBool modifyPositionButton = false.obs;
  RxBool modifyEmploymentButton = false.obs;


  resetModifyProfileButtons() {
    modifyBasicButton(false);
    modifyPositionButton(false);
    modifyEmploymentButton(false);
  }

  setModifyProfileButton({
    required String str,
  }) {
    if (str == 'Modify Basic Details') {
      modifyBasicButton(true);
    } else if (str == 'Modify Position Details') {
      modifyPositionButton(true);
    } else if (str == 'Modify Employment Details') {
      modifyEmploymentButton(true);
    }
  }
}
