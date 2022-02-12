import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:workify/models/UserModel.dart';
import 'package:workify/services/user_get_service.dart';

class UserController extends GetxController {
  late final UserModel currentUser;
  final UserService userService = Get.put(UserService());
  Future<void> getUser(String token) async {
    print("TOKEN is $token");
    final response = await userService.userGetService(token);
  }
}
