
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/customaztion.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/alldata.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/home.dart';
import 'package:fasty_admin/Data/Model/item_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomaztionController extends GetxController{
  CustomaztionData customaztionData = CustomaztionData(Get.find());
  HomeData homeData = HomeData(Get.find());
  final List<String> namesList = const ["Categories", "Sizes", "Extras"];
  final List<String> smallNamesList = const ["category", "size", "extra"];
  List showingList = [];
  TextEditingController customaztionNameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  StatusRequest statusRequest = StatusRequest.sucsses;
  int currentSection = 0;
  String searchText = "";
  List searchedShowingList = [];


     @override
  void onInit() async{
    changeList();
    super.onInit();
  }

     getData() async{
    if(statusRequest != StatusRequest.loading){
    statusRequest = StatusRequest.loading;
    update();
    }
    statusRequest = await homeData.getAllData();
    if(statusRequest == StatusRequest.sucsses){
      changeList();
    }else{
      update();
    }
     
  }
  changeList(){
    currentSection == 0 ? showingList = AllData().categories : currentSection == 1 ?  showingList = AllData().sizes : 
    showingList = AllData().extras;
    search(searchText);
  }
  changeSection(int i){
    currentSection = i;
    changeList();
  }

  int getItemsCount(int id){

    List count;
    if(currentSection == 0){
      count = AllData().items.where((item)=> item.category == id).toList();
    } else if(currentSection == 1){
      count = AllData().itemSizes.where((itemSize)=> itemSize.size == id).toList();
    }else{
      count = AllData().itemExtras.where((itemExtra)=> itemExtra.extra == id).toList();
    }
    return count.length;

  }

  toLinkedItems(int id){
    List<ItemModel> items;
    String name;
    if(currentSection == 0){
      items = AllData().items.where((item)=> item.category == id).toList();
      name = AllData().categories.firstWhere((c)=>c.id == id).name!;
    } else if(currentSection == 1){
    List<int> itemsIds = AllData().itemSizes.where((itemSize)=> itemSize.size == id).map((itemSize)=>itemSize.item!).toList();
    items = AllData().items.where((item)=>(itemsIds.contains(item.id))).toList();
    name = AllData().sizes.firstWhere((s)=>s.id == id).name!;
    }else{
    List<int> itemsIds = AllData().itemExtras.where((itemExtra)=> itemExtra.extra == id).map((itemExtra)=>itemExtra.item!).toList();
    items = AllData().items.where((item)=>(itemsIds.contains(item.id))).toList();
    name = AllData().extras.firstWhere((e)=>e.id == id).name!;
    }
    Get.toNamed(AppRoutes.linkedItems, arguments: {"items" : items, "name" : name});
  }

        delete(int id) {
         deleteCustomaztion(smallNamesList[currentSection], getItemsCount(id), 
         ()async{await confirmDelete(id);});
  }

    confirmDelete(int id) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await customaztionData.delete(id, namesList[currentSection].toLowerCase());
    statusRequest = handlingData(response);
    if(StatusRequest.sucsses == statusRequest){
    Get.back(); 
      await getData();
    }
  }

  add() {
    customaztionNameController.clear();
  addCustomaztion("Add", smallNamesList[currentSection],  ()async{ await confirmAdd();}, customaztionNameController);
  }

    confirmAdd() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await customaztionData.add(customaztionNameController.text, namesList[currentSection].toLowerCase());
    statusRequest = handlingData(response);
     Get.back();
    if(StatusRequest.sucsses == statusRequest){
      await getData();
    }
  }

    edit(int id, String name) {
  customaztionNameController.text = name;
  addCustomaztion("Edit", smallNamesList[currentSection],  ()async{ await confirmEdit(id);}, customaztionNameController);
  }

    confirmEdit(int id) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await customaztionData.update(id, customaztionNameController.text, namesList[currentSection].toLowerCase());
    statusRequest = handlingData(response);
     Get.back();
    if(StatusRequest.sucsses == statusRequest){
      await getData();
    }
  }

    search(String val){
    searchText = val;
    if(val == ""){searchedShowingList = showingList;}
    else{
      searchedShowingList = showingList.where((item) => item.name.toLowerCase().contains(val.toLowerCase())).toList();
    }
    update();
  }


}