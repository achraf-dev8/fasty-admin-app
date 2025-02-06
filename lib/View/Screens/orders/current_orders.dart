

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Screens/orders/orders.dart';
import 'package:fasty_admin/controller/orders/current_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CurrentOrders extends GetView<CurrentOrdersController> {
  
  const CurrentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CurrentOrdersController());
    return Scaffold(
      
      body: RefreshIndicator(
       color: AppColors.blue,
      strokeWidth: 3,
      onRefresh: () async{
         await controller.getData();},
        child: 
          GetBuilder<CurrentOrdersController>(
            builder: (controller) => HandlingRequestView( update: (){controller.getData();}, 
            statusRequest: controller.statusRequest, widget: Orders(text: controller.searchText,
              showFilter: true, filter: (){controller.filter();}, 
              title: "Pending Orders", orders: controller.searchedOrders, approve: 
              (val)async {await controller.approve(val);}, disapprove: (val)async {await controller.disapprove(val);},
              search: (val){controller.search(val);}, filterNames: const ["All", "Pending Approval", "Approved"], 
              filterTitle: "currentOrderFilter",
                ),
            )
          ),
      ) 
    );}
}
