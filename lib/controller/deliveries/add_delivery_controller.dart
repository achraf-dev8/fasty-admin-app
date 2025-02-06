import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/deliveries.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddDeliveryController extends GetxController{

  DeliveryData deliveryData = DeliveryData(Get.find());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();
  
  bool passwordObscureText = true;

   bool repeatObscureText = true;

   bool wrongConfirmation = false;

   StatusRequest statusRequest = StatusRequest.loading;

   String? loginExists;

    confirm()async{

  wrongConfirmation = !(password.text == confirmPassword.text);
  loginExists = null;
  update();
          await  Future.delayed(const Duration(milliseconds: 100), () {});

      if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await deliveryData.addDelivery(password.text, name.text, phoneNumber.text);
      statusRequest = handlingData(response);
      if(StatusRequest.sucsses == statusRequest){
        if(response["status"] == "success"){
         Get.offNamedUntil(AppRoutes.deliveries, (route) => route.settings.name == AppRoutes.home,);  
         update();
        }else{
          loginExists = "This phone number is already used";
          update();
          await Future.delayed(const Duration(milliseconds: 10), () {
    formKey.currentState!.validate();
  });
        }
      }else{
        update();
      }
    }
  }

  passwordShowHideText(){
  passwordObscureText = !passwordObscureText;
  update();

}
repeatShowHideText(){
  repeatObscureText = !repeatObscureText;
  update();
}

}