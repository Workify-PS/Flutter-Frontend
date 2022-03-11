import 'package:get/get.dart';
import 'package:workify/controllers/LeavePage/AllEmployeeLeavesController.dart';
import 'package:workify/models/LeavePage/AllEmployeeLeavesModel.dart';

class NotificationController extends GetxController {
  RxList<AllEmployeeLeavesModel> notifs = <AllEmployeeLeavesModel>[].obs;
  @override
  void onInit() {
    notifs.addAll(Get.find<AllEmployeeLeavesController>().leaveList);
    super.onInit();
  }
}
