import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/mixins/cache.dart';
import 'package:workify/models/WishModel.dart';

class WishGetService extends GetConnect with CacheManager{
  final String bdayURL = "http://localhost:8080/workify/v1/wish/birthday";
  final String annURL = "http://localhost:8080/workify/v1/wish/anniversary";
  final String newJURL = "http://localhost:8080/workify/v1/wish/newjoiners";
  Future<List<WishModel>?> getBirthday() async {
    var headers = {'Content-Type': 'application/json'};
    final response = await get(bdayURL, headers: headers);
    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> bdays = response.body;
      return bdays.map((e) => WishModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<WishModel>?> getAnniversary() async {
    final token = getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final response = await get(annURL, headers: headers);
    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> ann = response.body;
      return ann.map((e) => WishModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<WishModel>?> getNewjoiners() async {
    var headers = {'Content-Type': 'application/json'};
    final response = await get(newJURL, headers: headers);
    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> newJ = response.body;
      return newJ.map((e) => WishModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
