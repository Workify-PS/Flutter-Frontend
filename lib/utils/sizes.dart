import 'package:flutter/material.dart';



class DeviceSize {
  static final DeviceSize _singleton = DeviceSize._internal();

  factory DeviceSize() {
    return _singleton;
  }

  DeviceSize._internal();
  static double masterHeight = 541.1681518554688;
  static double masterWidth = 1161.3450927734375;
  late Size size;
  double get heightMultiplier => size.height / masterHeight;
  double get widthMultiplier => size.width / masterWidth;
}
