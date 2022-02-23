import 'package:get/get.dart';

class ModifyProfileWidgetsController extends GetxController {
  RxString modifyProfileWidgetString = 'Employee Basic Details'.obs;

  updateModifyProfileWidgetString(String str) {
    modifyProfileWidgetString(str);
  }

  RxBool employeeBasicDetailsButton = true.obs;
  RxBool modifyPositionButton = false.obs;
  RxBool modifyEmploymentButton = false.obs;

  resetModifyProfileButtons() {
    employeeBasicDetailsButton(false);
    modifyPositionButton(false);
    modifyEmploymentButton(false);
  }

  setModifyProfileButton({
    required String str,
  }) {
    if (str == 'Employee Basic Details') {
      employeeBasicDetailsButton(true);
    }
    else if (str == 'Modify Position Details') {
      modifyPositionButton(true);
    }
    else if (str == 'Modify Employment Details') {
      modifyEmploymentButton(true);
    }
  }
}
