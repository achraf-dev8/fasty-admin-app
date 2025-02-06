



import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/customaztion.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/home.dart';
import 'package:fasty_admin/Data/Model/simple_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectBottomController extends GetxController{

  HomeData homeData = HomeData(Get.find());
  CustomaztionData customaztionData = CustomaztionData(Get.find());
  TextEditingController customaztionNameController = TextEditingController();
  List<SimpleModel> items  = [];
  List<SimpleModel> searchedItems  = [];
  List<String> names  = [];
  int? selectedId = -1;
  List<int>? selectedIds = [];
  StatusRequest statusRequest = StatusRequest.sucsses;
  String searchText = "";
  dynamic Function()? add = (){};


   @override
  void onReady() async{

       statusRequest = await homeData.getAllData();
      items = add!();
      search(searchText);
  searchedItems = items;
defineNames();
super.onReady();
  }


    onChange(int i){
    
    if(selectedId != null){
      selectedId = searchedItems[i].id;
    }else{
     if(selectedIds!.contains(searchedItems[i].id)){
      selectedIds!.remove(searchedItems[i].id);
    }else{
      selectedIds!.add(searchedItems[i].id);
    }
    }
    
    update();
    }

    save(){
    Get.back();
    }

    search(String val){
      searchText = val;
    if(val == ""){searchedItems = items;}
    else{
      searchedItems = items.where((item) => item.name.toLowerCase().contains(val.toLowerCase())).toList();
    }
    defineNames();
  }

  defineNames(){
    names = searchedItems.map((item)=> item.name).toList();
    update();
  }

  bool isSelected(int i){
    if(selectedId != null){
      return selectedId == searchedItems[i].id;
    }

    return selectedIds!.contains(searchedItems[i].id);
  }

     onPressedReturn(){
    if(selectedId != null){
      return searchedItems.firstWhere((item)=>item.id == selectedId);
    }else{
    return searchedItems.where((item)=>selectedIds!.contains(item.id)).toList();
    }

  }

      adFunction(String customaztionName, dynamic Function() add) {
  String customaztion = customaztionName == "category" ? "categories" : "$customaztionName""s";
  addCustomaztion("Add", customaztionName,  ()async{ await confirmAdd(customaztion, add);}, customaztionNameController);
  }

     confirmAdd(String customaztion, dynamic Function() add) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await customaztionData.add(customaztionNameController.text, customaztion);
    statusRequest = handlingData(response);
    
    if(statusRequest == StatusRequest.sucsses){
      statusRequest = await homeData.getAllData();
      
      items = add();
      search(searchText);
    }else{
      statusRequest = StatusRequest.loading;
    }
   customaztionNameController.clear();
    Get.back();
    update();
  }



}