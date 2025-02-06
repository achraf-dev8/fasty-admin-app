
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Core/Functions/validator.dart';
import 'package:fasty_admin/View/Widgets/Classes/textfeild.dart';
import 'package:fasty_admin/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


Widget nameTextField(TextEditingController controller){
  return TextFeild(label: "Name", textController: controller, valid: (val){return validInput(val!, 2, 30, 
  "Name", null);},);
}

Widget passwordTextFeild(String label, TextEditingController controller, bool shouldValid, bool shouldCheck, bool obscureText, final void Function()? onIconPressed){
  return TextFeild(label: label, obscureText: obscureText, textController: controller, valid: (val){
    return shouldValid ? validInput(val!, 8, 25, "Password", null) : val!.isEmpty ? "Enter a password" :
    shouldCheck && val != sharedPrefs.getString("password") ? "Wrong password" :
     null;
}, onIconPressed : onIconPressed);
}

Widget confrimPasswordTextFeild(String label, TextEditingController controller, bool obscureText, final void Function()? onIconPressed, var parentController){
  return TextFeild(label: "Confirm $label", obscureText: obscureText, textController: controller, valid: (val){
    if(val!.isEmpty){  return "Confirm your $label"; } if(parentController.wrongConfirmation){return "The passwords don't match";}
}, onIconPressed : onIconPressed);
}

Widget phoneTextFeild(TextEditingController controller, GetxController parentController){
  return TextFeild(label: "Phone number", textController: controller, 
  valid: (val){return validInput(val!, 10, 20, "Phone number", parentController);}, numiric : false);
}


