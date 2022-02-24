import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/models/WishModel.dart';

class WishGetService extends GetConnect {
  final String bdayURL = "http://localhost:8080/workify/v1/wish/birthday";
  final String annURL = "http://localhost:8080/workify/v1/wish/birthday";
  final String newJURL = "http://localhost:8080/workify/v1/wish/birthday";
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
}
