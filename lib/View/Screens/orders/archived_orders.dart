

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Screens/orders/orders.dart';
import 'package:fasty_admin/controller/orders/archived_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivedOrders extends GetView<ArchivedOrdersController> {

  const ArchivedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ArchivedOrdersController());
    return Scaffold(
      
      body: RefreshIndicator(
       color: AppColors.blue,
      strokeWidth: 3,
      onRefresh: () async{
         await controller.getData();},
        child: 
          GetBuilder<ArchivedOrdersController>(
            builder: (controller) => HandlingRequestView( update: (){controller.getData();}, 
            statusRequest: controller.statusRequest, widget: Orders(text: controller.searchText,
              showFilter: true, filter: (){controller.filter();}, 
              title: "Archived Orders", orders: controller.searchedOrders, approve: 
              (val)async {}, disapprove: (val)async {}, filterNames: const ["All", "Shipped", "Disapproved"], 
              filterTitle: "archivedOrderFilter", search: (val){controller.search(val);},
                ),
            )
          ),
      ) 
    );}
}
