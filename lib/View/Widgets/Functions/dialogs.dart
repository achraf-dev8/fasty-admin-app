




import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Widgets/Classes/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


    deleteDialog(String title, void Function()? onPressed){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 8.5),
      title: title,
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 18.5),
      content:  const Column(children: [Icon(FontAwesomeIcons.trash, color: AppColors.brownRed, size: 28,),]),
      cancel: confirmButton("Yes", onPressed),

      confirm: cancelButton("No"));
  }


      orderDialog(String text, void Function()? onPressed){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title: text,
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: const SizedBox(height: 2,),
      cancel: confirmButton("Yes", onPressed),

      confirm: cancelButton("No") );
  }

        dissaproveDialog(void Function()? onPressed, TextEditingController controller){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title: "Why did you disapprove this order?",
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: Row(
        children: [
         Flexible(
          child: TextFeild(maxLines: 3, label: "Reason", textController: controller, valid: (val){return null;},)),
        ],
      ),
      cancel: confirmButton("Confirm", onPressed),

      confirm: cancelButton("Cancel") 
      
      );
  }
          deleteCustomaztion(String section, int count, void Function()? onPressed){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title: section != "category" ? "Are you sure you want to remove this $section? It is linked to $count items" : 
      "Are you sure you want to remove this category? this will remove $count items!",
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: Container(),
      cancel: confirmButton("Confirm", onPressed),

      confirm: cancelButton("Cancel") 
      
      );
  }
            deleteFaq(void Function()? onPressed){
     Get.defaultDialog(
      backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title: "Are you sure you want to delete this question?",
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: Container(),
      cancel: confirmButton("Confirm", onPressed),
      confirm: cancelButton("Cancel"),
      );
  }

          addCustomaztion(String state, String section, void Function()? onPressed, TextEditingController controller){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title:  "$state $section",
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: Flexible(
       child: TextFeild(maxLines: 3, label: "${section.capitalize}", textController: controller, valid: (val){
         return "Enter a $section";},)),
      cancel: confirmButton("Confirm", onPressed),

      confirm: cancelButton("Cancel") 
      
      );
  }

               addQuestion(String state, void Function()? onPressed, TextEditingController question, TextEditingController answer){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title:  "$state question",
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: Column(
        children: [
         TextFeild(label: "Question", textController: question, valid:
          (val){if(val!.isEmpty) return "Enter a  question";},),
         TextFeild(maxLines: 4,
         minLines: 3,
          label: "Answer", textController: answer, valid: (val){if(val!.isEmpty) return "Enter an answer";},)
        ],
      ),
      cancel: confirmButton("Confirm", onPressed),

      confirm: cancelButton("Cancel") 
      
      );
  }

            sendNotification(TextEditingController title, TextEditingController body, void Function()? onPressed){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title:  "Send notification",
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: Column(
        children: [
         TextFeild(maxLines: 1, label: "Title", textController: title, valid: (val){if(val!.isEmpty) return "Enter a title";},),
        TextFeild(maxLines: 3, minLines: 2, label: "Body", textController: body, valid: (val){if(val!.isEmpty) return "Enter a body";},),
        ],
      ),
      cancel: confirmButton("Confirm", onPressed),

      confirm: cancelButton("Cancel") 
      
      );
  }


  Widget confirmButton(String text, void Function()? onPressed){
    return dialogButton(text, onPressed, AppColors.organgeYellow, AppColors.white);
  }


    Widget cancelButton(String text){
    return dialogButton(text, (){Get.back();}, AppColors.white, AppColors.organgeYellow);
  }

  Widget dialogButton(String text, void Function()? onPressed, Color buttonColor, Color textColor){
    return Padding(
        padding: const EdgeInsets.only(left:16.0),
        child: OutlinedButton(onPressed: onPressed, 
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          side: const BorderSide(color: AppColors.organgeYellow, width: 2),
        ), child:  Text(text, 
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 16.5),)),
      );
  }