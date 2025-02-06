



import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/delivery_card.dart';
import 'package:fasty_admin/View/Widgets/Classes/search_textfeild.dart';
import 'package:fasty_admin/controller/deliveries/deliveries_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Deliveries extends GetView<DeliveriesController> {
  const Deliveries({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> DeliveriesController());
    return GetBuilder<DeliveriesController>(
      builder: (controller) => Scaffold(
        floatingActionButton: floatingButton(() {Get.toNamed(AppRoutes.addDelivery);}, 
        controller.statusRequest == StatusRequest.sucsses,), 
        body: 
            HandlingRequestView( statusRequest: controller.statusRequest, update: ()async{await controller.getData();},
              widget: authPadding(
                ListView(children: [
                    textBackButtonAppBar(context, "Deliveries"),
                     const SizedBox(height: 8,),
                     SearchTextfeild(search: (val){controller.search(val);}, fontSize: 16, text: controller.searchText),
                    const SizedBox(height: 12,),
                    
                      ListView.builder(
                        shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                       itemCount: controller.searchedDeliveries.length,
                    itemBuilder: (context, i) => DeliveryCard(delivery: controller.searchedDeliveries[i], 
                    delete:()async{await controller.delete(controller.searchedDeliveries[i].id!);},)
                    ), const SizedBox(height: 20,)
                  
                    ],),
               ),
            ),),
    );
            
              
  }

  Widget test(){
    return Container();
  }
}