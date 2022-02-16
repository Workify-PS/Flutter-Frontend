import 'package:flutter/material.dart';

class DeviceSize {
  static final DeviceSize _singleton = DeviceSize._internal();

  factory DeviceSize() {
    return _singleton;
  }

  DeviceSize._internal();
  static double masterHeight = 612;
  static double masterWidth = 1366;
  late Size size;
  double get heightMultiplier => size.height / masterHeight;
  double get widthMultiplier => size.width / masterWidth;
}


