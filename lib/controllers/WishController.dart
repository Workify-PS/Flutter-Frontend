import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:workify/models/WishModel.dart';
import 'package:workify/services/wish_get_service.dart';

class WishController extends GetxController {
  late List<WishModel> bdays;
  late List<WishModel> anniversary;
  late List<WishModel> newj;
}
