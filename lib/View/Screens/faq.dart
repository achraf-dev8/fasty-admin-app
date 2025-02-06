import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Classes/custumaztion_card.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/search_textfeild.dart';
import 'package:fasty_admin/controller/customaztion/customaztion_controller.dart';
import 'package:fasty_admin/controller/faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Faq extends GetView<FaqController> {


  const Faq({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> FaqController());
    return GetBuilder<FaqController>(
       builder: (controller) =>  Scaffold(
      floatingActionButton: floatingButton(()async { await controller.add();}, 
      controller.statusRequest == StatusRequest.sucsses, ),    
      
      body: SafeArea(
        child:HandlingRequestView( statusRequest: controller.statusRequest, update: (){controller.getData();},
         widget: authPadding(
            ListView(
              children: [ textBackButtonAppBar(context, "FAQ"),
              const SizedBox(height: 12,),
              ListView.builder( shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
              itemCount : controller.questions.length,
              itemBuilder: (builder, i)=>CustumaztionCard(name: controller.questions[i].question!, 
             desc: controller.questions[i].answer!, 
            delete: ()async{await controller.delete(i);}, 
            edit: () async{await controller.edit(i);},
          onPressed: null,
                       ))
              ],
            ),
          ),
       ),
      ),
    ));
  }

}