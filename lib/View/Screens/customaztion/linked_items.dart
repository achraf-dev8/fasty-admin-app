

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Core/Functions/get_item_info.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/item_card.dart';
import 'package:fasty_admin/View/Widgets/Classes/search_textfeild.dart';
import 'package:fasty_admin/controller/customaztion/linked_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkedItems extends GetView<LinkedItemsController> {
  const LinkedItems({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> LinkedItemsController());
    return Scaffold(
      body:
        GetBuilder<LinkedItemsController>( builder: (controller) =>
          authPadding(
            ListView(children: [
                textBackButtonAppBar(context, "Linked Items"),
                 const SizedBox(height: 8,),
                 Text(Get.arguments["name"], style: const TextStyle(color: AppColors.black, 
                        fontSize: 23, fontWeight: FontWeight.bold),),
                 SearchTextfeild(search: (val){controller.search(val);}, fontSize: 16, text: controller.searchText),
                const SizedBox(height: 12,),
                
                  ListView.builder(
                    shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                   itemCount: controller.items.length,
                itemBuilder: (context, i) => ItemCard(item: controller.items[i], 
                sizes: globalGetExtrasNames(controller.items[i]), extras: globalGetExtrasNames(controller.items[i]), 
                itemSize: globalGetItemSize(controller.items[i]), delete: (item)async{await controller.delete(item);},
                onPressed: (){controller.toAdd(controller.items[i], Get.arguments["name"]);},
                )
                )
              
                ],),
           )),);}
}