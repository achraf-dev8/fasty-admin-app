
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddleWare extends GetMiddleware{

 int? get priorety => 1;

 @override
 RouteSettings? redirect(String? route){

  sharedPrefs.setString("itemsFilter", "Items");
  if(sharedPrefs.getString("currentOrderFilter") == null){
  sharedPrefs.setString("currentOrderFilter", "All");
  sharedPrefs.setString("archivedOrderFilter", "All");
  sharedPrefs.setString("offerFilter", "Food Item");
  sharedPrefs.setString("userOrders", "All");
  }
sharedPrefs.setInt("id", 2);
      if(sharedPrefs.getInt("id") != null && sharedPrefs.getInt("id") != -1){
      return const RouteSettings(name : AppRoutes.home);
  }
  return null;
  
 }
 

} 