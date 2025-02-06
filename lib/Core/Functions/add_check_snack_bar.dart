import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:get/get.dart';

bool addCheck(StatusRequest statusRequest){
       if(statusRequest == StatusRequest.offlinefailure){
      showSnackBar("Check your internet connection!");
      return false;
     }else if(statusRequest == StatusRequest.serverfailure){
      showSnackBar("Something went wrong, try again!");
      return false;
     }
     return true;
}

    showSnackBar(String msg){
        Get.showSnackbar( GetSnackBar(message: msg, 
        duration: const Duration(milliseconds: 1200),));
    }