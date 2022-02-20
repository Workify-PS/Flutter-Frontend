import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:workify/models/WishModel.dart';

class WishGetService extends GetConnect {
  final String wishGetURL = "http://localhost:8080/workify/v1/wish/birthday";
  Future<WishModel?> wishGetService() async {
    var headers = {'Content-Type': 'application/json'};

    try {
      final response = await get(wishGetURL, headers: headers);
      print("response status" + response.statusText.toString());
      if (response.statusCode == HttpStatus.ok) {
        // return WishModel.fromJson(response.body);
        print('\n-- In Wish get service file:: wishGetService(){} : Block 1\n');
        print(response.body);
        print('-------------- End Block 1 ---------------');
      } else {
        print(
            '\n-- In Wish get service file :: wishGetService(){} : Block 2\n');
        print(response.statusCode);
        print('-------------- End Block 2 ---------------');
      }
    } catch (e) {
      print('\n-- In Wish get service file :: wishGetService(){} : Block 1\n');
      print('Login Error :: ' + e.toString());
      print('-------------- End Block 1 ---------------');
    }
    // if (response.statusCode == HttpStatus.ok) {
    //   return WishModel.fromJson(response.body);
    // } else {
    //   return null;
    // }
  }
}
