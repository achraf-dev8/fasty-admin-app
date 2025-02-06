

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Screens/orders/orders.dart';
import 'package:fasty_admin/controller/users/user_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOrders extends GetView<UserOrdersController> {

  const UserOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UserOrdersController());
    return Scaffold(
      
      body: RefreshIndicator(
       color: AppColors.blue,
      strokeWidth: 3,
      onRefresh: () async{
         await controller.getData();},
        child: 
          GetBuilder<UserOrdersController>(
            builder: (controller) => HandlingRequestView( update: (){controller.getData();}, 
            statusRequest: controller.statusRequest, widget: Orders(text: controller.searchText,
              showFilter: true, filter: (){controller.filter();}, 
              title: "User Orders", orders: controller.searchedOrders, approve: 
              (val)async {}, disapprove: (val)async {}, filterNames: const ["All", "Pending Approval", "Approved", "Shipping", 
              "Shipped", "Disapproved"], 
              filterTitle: "userOrders", search: (val){controller.search(val);},
                ),
            )
          ),
      ) 
    );}
}
