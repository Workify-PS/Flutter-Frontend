import 'package:get/get.dart';
// import 'package:workify/screens/ProfileSection/ProfileSectionControllers/profile_details_controller.dart';

class ProfileWidgetsController extends GetxController {
  RxString widgetString = 'Basic Details'.obs;
  updateWidgetString(String str) {
    widgetString(str);
  }

  RxBool basicButton = true.obs;
  RxBool positionButton = false.obs;
  RxBool employmentButton = false.obs;
  // RxBool educationButton = false.obs;

  // RxList<bool> buttonPressed = [false, false, false, false].obs;

  resetButtons() {
    // for (int i = 0; i < buttonPressed.length; i++) {
    //   buttonPressed[i] = false;
    // }
    basicButton(false);
    positionButton(false);
    employmentButton(false);
    // educationButton(false);
  }

  setButton({
    required String str,
    // required int index,
  }) {
    // buttonPressed[index] = true;
    if (str == 'Basic Details') {
      basicButton(true);
    } else if (str == 'Position Details') {
      positionButton(true);
    } else if (str == 'Employment Details') {
      employmentButton(true);
    }
    //  else if (str == 'Education Details') {
    //   educationButton(true);
    // }
  }
}
