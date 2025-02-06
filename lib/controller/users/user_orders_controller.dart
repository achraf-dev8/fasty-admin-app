

import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/users.dart';
import 'package:fasty_admin/Data/Model/order_model.dart';
import 'package:fasty_admin/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOrdersController extends GetxController{
  UsersData userData = UsersData(Get.find());
  int id = 0;
  StatusRequest statusRequest = StatusRequest.loading;
   TextEditingController disapproveMsg = TextEditingController();
  List<OrderModel> orders = [];
  String searchText = "";
  List<OrderModel> filteredOrders = [];
  List<OrderModel> searchedOrders = [];


   @override
  void onReady() async{
    id = Get.arguments;
    await getData();
    super.onReady();
  }

   getData() async{
    if(statusRequest != StatusRequest.loading){
    orders = [];
    statusRequest = StatusRequest.loading;
    update();
    }
    var response = await userData.showOrders(id);
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
    String ordersFilter = sharedPrefs.getString("userOrders")!;
    if(ordersFilter == "Pending Approval"){
      filteredOrders = orders.where((order) => order.state == 0).toList();
    }else if(ordersFilter == "Approved"){
      filteredOrders = orders.where((order) => order.state == 1).toList();
    } else if(ordersFilter == "Disapproved"){
      filteredOrders = orders.where((order) => order.state == -1).toList();
    }else if(ordersFilter == "Shipped"){
      filteredOrders = orders.where((order) => order.state == 3).toList();
    }else if(ordersFilter == "Shipping"){
      filteredOrders = orders.where((order) => order.state == 2).toList();
    } else{
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



