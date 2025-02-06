

import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/orders/show_orders.dart';
import 'package:fasty_admin/Data/Model/order_model.dart';
import 'package:get/get.dart';

class ShippingOrdersController extends GetxController{
  ShowOrders showOrderData = ShowOrders(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<OrderModel> orders = [];
  String searchText = "";
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
    var response = await showOrderData.shippingOrders();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      for(int i=0; i<response["orders"].length ; i++){
        orders.add(OrderModel.fromJson(response["orders"][i]));
      }
      search(searchText);
    }else{
      update();
    }
     
  }

  search(String val){
    searchText = val;
    if(val == ""){searchedOrders = orders;}
    else{
    int? num = int.tryParse(val);
    if(num != null){
      searchedOrders = [];
      OrderModel? order = orders.firstWhereOrNull((order)=>order.id == num);
      order != null ? searchedOrders.add(order): null;
    }
    }
    update();
  }


  }



