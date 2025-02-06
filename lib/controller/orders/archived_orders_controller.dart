

import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/orders/show_orders.dart';
import 'package:fasty_admin/Data/Model/order_model.dart';
import 'package:fasty_admin/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivedOrdersController extends GetxController{
  ShowOrders showOrderData = ShowOrders(Get.find());
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
    var response = await showOrderData.archivedOrders();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      for(int i=0; i<response["orders"].length ; i++){
        orders.insert(0, OrderModel.fromJson(response["orders"][i]));
      }
      filter();
    }else{
      update();
    }
     
  }

  filter(){
    String archivedOrderFilter = sharedPrefs.getString("archivedOrderFilter")!;
    if(archivedOrderFilter == "Disapproved"){
      filteredOrders = orders.where((order) => order.state == -1).toList();
    }else if(archivedOrderFilter == "Shipped"){
      filteredOrders = orders.where((order) => order.state == 3).toList();
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



