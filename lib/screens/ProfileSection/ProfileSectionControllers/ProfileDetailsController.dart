import 'package:workify/apimodule/profile_api_service.dart';
import 'package:get/get.dart';
import 'package:workify/models/profileModel.dart';

class ProfileDetailsController extends GetxController {
  var isLoading = true.obs;
  // Map<String, dynamic> profileModelDetails = {'name': 'My name is Amar'}.obs;
  ProfileModel? profileModelDetails;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProfileDetails();
  }

  void fetchProfileDetails() async {
    try {
      isLoading(true);
      var profileDetails = await ProfileApiService.profileDetails();
      print('\n\n');
      if (profileDetails != null) {
        print('In Profile Details Controller file :');
        print('-----------------------------');
        print('\nData received\n');
        print(profileDetails.runtimeType);
        print(profileModelDetails.runtimeType);
        print('-----------------------------');
      }
    } finally {
      isLoading(false);
    }
  }
}
