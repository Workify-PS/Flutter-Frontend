import 'package:get_storage/get_storage.dart';

mixin Cache {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.ACCESS_TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.ACCESS_TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.ACCESS_TOKEN.toString());
  }
}

enum CacheManagerKey { ACCESS_TOKEN }
