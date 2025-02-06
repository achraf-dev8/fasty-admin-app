

import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Core/Functions/checkinternet.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/login.dart';
import 'package:fasty_admin/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{ 
  
  LoginData logindata = LoginData(Get.find());
  GlobalKey <FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool wrongLoginInfo = false;
  StatusRequest statusRequest = StatusRequest.loading;

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }

  @override
    void onInit() async{
      await updateStatusRequest();
    super.onInit();
  }

  login() async{
wrongLoginInfo = false;
    if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.postData(usernameController.text, passwordController.text);
      statusRequest = handlingData(response);
      if(StatusRequest.sucsses == statusRequest){
        if(response["status"] == "success"){
          fetchUserData(response);
         await Get.offAllNamed(AppRoutes.home);
         update();
        }else{
          wrongLoginInfo = true;
        }
      
      }
    }
    update();
    
}

showHideText(){
  obscureText = !obscureText;
  update();
}


fetchUserData(response){
         var data = response["data"];
         sharedPrefs.setInt("id", data["id"]);
         sharedPrefs.setString("username", data["username"]);
         sharedPrefs.setString("password", data["password"]);
}


}