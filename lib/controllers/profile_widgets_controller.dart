import 'package:get/get.dart';

class ProfileWidgetsController extends GetxController {
  RxString widgetString = 'Basic Details'.obs;

  updateWidgetString(String str) {
    widgetString(str);
  }


  RxBool basicButton = true.obs;
  RxBool positionButton = false.obs;
  RxBool employmentButton = false.obs;
  RxBool modifyButton = false.obs;
  RxBool modifyBasicButton = false.obs;

  resetButtons() {
    basicButton(false);
    positionButton(false);
    employmentButton(false);
    modifyButton(false);
    modifyBasicButton(false);
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
    } else if (str == 'Modify Basic Details') {
      modifyBasicButton(true);
    } else if (str == 'Modify Profile Details') {
      modifyButton(true);
    }
  }
}
