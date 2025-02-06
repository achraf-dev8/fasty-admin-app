

import 'dart:io';

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class DeliveryData{
  Crud crud;
  DeliveryData(this.crud);

  showDeliveries() async{
  return await crud.postRequest(ApiLinks.deliveriesShow, {});}
  
  deleteDelivery(int id) async{
    return await crud.postRequest(ApiLinks.deliveriesDelete, {
    "id" : id.toString()
    });
  }

  showOrders(int id) async{
    return await crud.postRequest(ApiLinks.usersOrders, {
    "id" : id.toString()
    });
  }

  addDelivery(String password, String name, String phoneNumber) async{
        return await crud.postRequest(ApiLinks.deliveriesAdd, {
    "password" : password, "name" : name, "phone_number" : phoneNumber
    });
  }

    orderOffer(List<int> ids) async{
    return await crud.postRequest(ApiLinks.offerOrder, {
    "ids" : ids.toString()
    });}

}