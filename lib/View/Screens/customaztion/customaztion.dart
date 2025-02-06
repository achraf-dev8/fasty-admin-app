import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Classes/custumaztion_card.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/search_textfeild.dart';
import 'package:fasty_admin/controller/customaztion/customaztion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customaztion extends GetView<CustomaztionController> {


  const Customaztion({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> CustomaztionController());
    return GetBuilder<CustomaztionController>(
       builder: (controller) =>  Scaffold(
      floatingActionButton: floatingButton(()async { await controller.add();}, 
      controller.statusRequest == StatusRequest.sucsses, ),    
      
      body: SafeArea(
        child:HandlingRequestView( statusRequest: controller.statusRequest, update: (){controller.getData();},
         widget: authPadding(
            ListView(
              children: [ textBackButtonAppBar(context, "Customaztion"),
              const SizedBox(height: 11,),
                     Column( children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children:  List.generate(controller.namesList.length, (val) => Column(
                         children: [
                           textButton(controller.namesList[val], (){controller.changeSection(val);}, TextStyle(
                                 fontSize: controller.currentSection == val ? 20 :19,
                                 color: controller.currentSection == val ? AppColors.organgeYellow : AppColors.darkMediumGrey,
                               ),),
                           AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                             margin: const EdgeInsets.only(top: 2),
                             height: 3,
                             width: controller.currentSection  == val ? 60 : 0,
                             color: AppColors.organgeYellow,
                           ),
                         ],
                       ),
                            ), ), 
                        const SizedBox(height: 15), SearchTextfeild(text: controller.searchText,
                          search: (val){controller.search(val);}, fontSize: 16), 
                        const SizedBox(height: 12),
                    ListView.builder( shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                      itemCount : controller.searchedShowingList.length,
                      itemBuilder: (builder, i)=>CustumaztionCard(name: controller.searchedShowingList[i].name, 
                      desc: "${controller.getItemsCount(controller.searchedShowingList[i].id)} linked items",
                      delete: ()async{await controller.delete(controller.searchedShowingList[i].id);}, 
                      edit: () async{await controller.edit(controller.searchedShowingList[i].id, controller.searchedShowingList[i].name);},
                      onPressed: (){controller.toLinkedItems(controller.searchedShowingList[i].id);},
                      ))
                    ]
            )],
            ),
          ),
       ),
      ),
    ));
  }

}