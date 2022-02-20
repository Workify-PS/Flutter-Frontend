import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workify/models/UserModel.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage('USER');
    await box.write(CacheManagerKey.ACCESS_TOKEN.toString(), token);
    return true;
  }

  Future<void> saveUser(UserModel user) async {
    final box = GetStorage('USER');
    box.write(CacheManagerKey.USER.toString(), user);
  }
  Future<void> saveAppSettings(ThemeMode theme)async{
    final box = GetStorage('APP_SETTINGS');
    box.write(CacheManagerKey.THEME.toString(), theme.name);
  }

  String? getToken() {
    final box = GetStorage('USER');
    return box.read(CacheManagerKey.ACCESS_TOKEN.toString());
  }

  UserModel? getUser() {
    final box = GetStorage('USER');
    return UserModel.fromJson(box.read(CacheManagerKey.USER.toString()));
  }

  Future<void> removeToken() async {
    final box = GetStorage('USER');
    await box.remove(CacheManagerKey.ACCESS_TOKEN.toString());
  }

  Future<void> removeUser() async {
    final box = GetStorage('USER');
    await box.remove(CacheManagerKey.USER.toString());
  }
  
}

enum CacheManagerKey { USER, ACCESS_TOKEN,THEME }
