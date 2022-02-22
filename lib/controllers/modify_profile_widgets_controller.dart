import 'package:get/get.dart';

class ModifyProfileWidgetsController extends GetxController{
  RxString modifyProfileWidgetString = 'Modify Position Details'.obs;

    updateModifyProfileWidgetString(String str) {
    modifyProfileWidgetString(str);
  }

  RxBool modifyPositionButton = true.obs;
  RxBool modifyEmploymentButton = false.obs;

  resetModifyProfileButtons() {
    modifyPositionButton(false);
    modifyEmploymentButton(false);
  }

  setModifyProfileButton({
    required String str,
  }) {
    if (str == 'Modify Position Details') {
      modifyPositionButton(true);
    } else if (str == 'Modify Employment Details') {
      modifyEmploymentButton(true);
    }
  }

}