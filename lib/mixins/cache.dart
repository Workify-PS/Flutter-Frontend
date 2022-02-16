import 'package:get_storage/get_storage.dart';
import 'package:workify/models/UserModel.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage('APP_SETTINGS');
    await box.write(CacheManagerKey.ACCESS_TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage('APP_SETTINGS');
    return box.read(CacheManagerKey.ACCESS_TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage('APP_SETTINGS');
    await box.remove(CacheManagerKey.ACCESS_TOKEN.toString());
  }

  Future<void> saveUser(UserModel user) async {
    final box = GetStorage('USER');
    box.write("user", user);
  }
}

enum CacheManagerKey { ACCESS_TOKEN }
