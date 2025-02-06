

import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/orders/order.dart';
import 'package:fasty_admin/Data/DataSource/Remote/orders/show_orders.dart';
import 'package:fasty_admin/Data/Model/order_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:fasty_admin/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentOrdersController extends GetxController{
  ShowOrders showOrderData = ShowOrders(Get.find());
  OrderData orderData = OrderData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
   TextEditingController disapproveMsg = TextEditingController();
  List<OrderModel> orders = [];
  String searchText = "";
  List<OrderModel> filteredOrders = [];
  List<OrderModel> searchedOrders = [];


   @override
  void onInit() async{
    await getData();
    super.onInit();
  }

   getData() async{
    if(statusRequest != StatusRequest.loading){
    orders = [];
    statusRequest = StatusRequest.loading;
    update();
    }
    var response = await showOrderData.currentOrders();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      for(int i=0; i<response["orders"].length ; i++){
        orders.add(OrderModel.fromJson(response["orders"][i]));
      }
      filter();
    }else{
      update();
    }
     
  }

  approve(OrderModel order) async{

    await orderData.approveOrder(order.id!, order.user!);

    await getData();
  }

    disapprove(OrderModel order) async{
     
      dissaproveDialog(()async {confrimDisapprove(order);}, disapproveMsg);
    }


      confrimDisapprove(OrderModel order) async{

    await orderData.disapproveOrder(order.id!, disapproveMsg.text, order.user!);

    Get.back();

    await getData();
  }

  filter(){
    String currentOrderFilter = sharedPrefs.getString("currentOrderFilter")!;
    if(currentOrderFilter == "Pending Approval"){
      filteredOrders = orders.where((order) => order.state == 0).toList();
    }else if(currentOrderFilter == "Approved"){
      filteredOrders = orders.where((order) => order.state == 1).toList();
    }else{
      filteredOrders = orders;
    }

    search(searchText);
  }

  search(String val){
    searchText = val;
    if(val == ""){searchedOrders = filteredOrders;}
    else{
    int? num = int.tryParse(val);
    if(num != null){
      searchedOrders = [];
      OrderModel? order = filteredOrders.firstWhereOrNull((order)=>order.id == num);
      order != null ? searchedOrders.add(order): null;
    }
    }
    update();
  }


  }



