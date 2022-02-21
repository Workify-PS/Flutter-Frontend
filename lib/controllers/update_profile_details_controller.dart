import 'package:get/get.dart';
import 'package:workify/exceptions/print_log.dart';

class UpdateProfileDetailsController extends GetxController{

  void onSubmitBasicDetails(){
    PrintLog.printLog(
      fileName: 'update_profile_details_controller',
      functionName: 'Submit : onPressed',
      blockNumber: 1,
      printStatement: 'Basic Submit Clicked',
    );
  }

  void onSubmitPositionDetails(){
    PrintLog.printLog(
      fileName: 'update_profile_details_controller',
      functionName: 'Submit : onPressed',
      blockNumber: 1,
      printStatement: 'Position Submit Clicked',
    );
  }

  void onSubmitEmploymentDetails(){
    PrintLog.printLog(
      fileName: 'update_profile_details_controller',
      functionName: 'Submit : onPressed',
      blockNumber: 1,
      printStatement: 'Employment Submit Clicked',
    );
  }
}