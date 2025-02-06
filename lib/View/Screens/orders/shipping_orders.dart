

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Screens/orders/orders.dart';
import 'package:fasty_admin/controller/orders/shipping_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ShippingOrders extends GetView<ShippingOrdersController> {

  const ShippingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ShippingOrdersController());
    return Scaffold(
      
      body: RefreshIndicator(
       color: AppColors.blue,
      strokeWidth: 3,
      onRefresh: () async{
         await controller.getData();},
        child: 
          GetBuilder<ShippingOrdersController>(
            builder: (controller) => HandlingRequestView( update: (){controller.getData();}, 
            statusRequest: controller.statusRequest, widget: Orders(text: controller.searchText, filter: (){}, 
              title: "Shipping Orders", orders: controller.searchedOrders, approve: 
              (val)async {}, disapprove: (val)async {},
              search: (val){controller.search(val);},
                ),
            )
          ),
      ) 
    );}
}
