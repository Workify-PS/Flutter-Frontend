import 'package:get/get.dart';

class DateController extends GetxController {
  RxString date = ''.obs;

  updateDate(var date) {
    date(date);
  }
}
