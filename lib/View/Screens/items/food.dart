
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Functions/rows.dart';
import 'package:fasty_admin/View/Widgets/Classes/item_card.dart';
import 'package:fasty_admin/controller/food/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 
class Food extends GetView<FoodController> {
  const Food({super.key});
  @override
  Widget build(BuildContext context) {
      Get.lazyPut(()=>FoodController());
    return GetBuilder<FoodController>(
      builder: (controller) =>
         Scaffold(floatingActionButton: floatingButton(() {controller.toAdd(null);}, 
         controller.statusRequest == StatusRequest.sucsses,),    
          body: SafeArea(
              child: HandlingRequestView( statusRequest: controller.statusRequest, update: (){controller.homeData.getAllData();},
                  widget: authPadding(
                    ListView(children: [
                      textBackButtonAppBar(context, "Food (${controller.searchedshowedItems.length})"), 
                      const SizedBox(height: 8,),
                       searchRow(controller.searchText, "Show", (val){controller.search(val);}, 
                       (){controller.filter();}, 17, 25, false, const ["Items", "Item-Sizes"], "itemsFilter"),   
                      const SizedBox(height: 8,),
                      ListView.builder( shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.searchedshowedItems.length, itemBuilder: (context, i) => 
                        ItemCard(item: controller.getItem(i), delete: (item)async{await controller.delete(item);},
                        extras: controller.getExtrasNames(i), sizes: controller.getSizesNames(i), 
                        itemSize: controller.getItemSize(i), onPressed : () {controller.toAdd(controller.getItem(i));}
                        ),
                      ), const SizedBox(height: 10,), 
                    ],),
                  ),
                ),
            ),
        )
    ); 
    }
}
