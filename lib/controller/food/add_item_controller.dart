
import 'dart:io';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Core/Functions/uploadfile.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/alldata.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/home.dart';
import 'package:fasty_admin/Data/DataSource/Remote/items.dart';
import 'package:fasty_admin/Data/Model/extra_model.dart';
import 'package:fasty_admin/Data/Model/item_model.dart';
import 'package:fasty_admin/Data/Model/simple_model.dart';
import 'package:fasty_admin/Data/Model/size_model.dart';
import 'package:fasty_admin/View/Screens/bottomSheets/select_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddItemController extends GetxController{
   HomeData homeData = HomeData(Get.find());
  GlobalKey <FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController customaztionNameController = TextEditingController();
  ItemModel item = ItemModel();
  List<SimpleModel> categories = [];
  List<SimpleModel> sizes = [];
  List<SimpleModel> extras = [];
  SimpleModel? selectedCategory;
  List<SimpleModel> selectedSizes =[];
  List<SimpleModel> selectedExtras = [];
  File? file;
  String? image;
  bool changedSizes = true;
  ItemsData itemsData = ItemsData(Get.find());
  bool active = true;
  void Function() event = (){};

    @override
    void onReady() async{
    categories = AllData().categories.map((category)=>SimpleModel(id: category.id!, name: category.name!)).toList();
    sizes = AllData().sizes.map((size)=>SimpleModel(id: size.id!, name: size.name!)).toList();
    extras = AllData().extras.map((extra)=>SimpleModel(id: extra.id!, name: extra.name!)).toList();
    event = Get.arguments["event"];
    
    if(Get.arguments["item"] != null){
      item = Get.arguments["item"];
      name.text = item.name!; description.text = item.description!; image= item.image; 
      selectedCategory = categories.firstWhere((category)=> category.id == item.category);
      List<int> itemSizes = AllData().itemSizes.where((itemS)=>itemS.item == item.id).map((itemS)=>itemS.size ?? -1).toList();
      selectedSizes = sizes.where((size)=> itemSizes.contains(size.id)).toList();
     List<int> itemExtras = AllData().itemExtras.where((itemS)=>itemS.item == item.id).map((itemS)=>itemS.extra!).toList();
      selectedExtras = extras.where((extra)=> itemExtras.contains(extra.id)).toList();
      changedSizes = false;
      active = item.active == 1;
      event = Get.arguments["event"];
    }
    update();
    super.onReady();
  }

  chooseFile()async{
   file =  await fileUpload();
   update();
  }

    toCategorySelect(){
    Get.bottomSheet(SelectBottomSheet(onPressed: (item){categorySelection(item);}, text: "Select Category", items: categories, 
    selectedId: selectedCategory != null ? selectedCategory!.id : -1, customaztionName: "category", add: (){return add(AllData().categories);},
      ));
  }

 toSizesSelect(){
    Get.bottomSheet(SelectBottomSheet(onPressed: (item){sizesSelection(item);}, text: "Select Sizes", items: sizes, 
    selectedIds: selectedSizes.map((size)=> size.id).toList(), customaztionName: "size", add: (){return add(AllData().sizes);},
      ));
  }

   toExtrasSelect(){
    Get.bottomSheet(SelectBottomSheet(onPressed: (item){extrasSelection(item);}, text: "Select Extras", items: extras, 
    selectedIds: selectedExtras.map((extra)=> extra.id).toList(), customaztionName: "extra", add: (){return add(AllData().extras);},
      ));
  }

  categorySelection(SimpleModel? item){
    selectedCategory = item;
    update();
  }

    sizesSelection(List<SimpleModel> items){
    changedSizes = true;
    selectedSizes = items;
    update();
  }

   extrasSelection(List<SimpleModel> items){
    selectedExtras = items;
    update();
  }

    changeActive(bool val){
    active = val;
    update();
  }

   add(List list){
   return list.map((item)=>SimpleModel(id: item.id!, name: item.name!)).toList();
  }

      String getExtrasNames(){
   if(selectedExtras.isEmpty)return "No extras";
   List<int> extrasIds = selectedExtras.map((extra)=>extra.id).toList();
   List<ExtraModel> extrasModels = AllData().extras.where((extra)=>extrasIds.contains(extra.id)).toList();
   List<String> extrasNames = extrasModels.map((extra)=>extra.name!).toList();
   return extrasNames.join(', ');
  }

        String getSizeNames(){
   if(selectedSizes.isEmpty)return "No Sizes";
   List<int> sizesIds = selectedSizes.map((size)=>size.id).toList();
   List<SizeModel> sizesModels = AllData().sizes.where((size)=>sizesIds.contains(size.id)).toList();
   List<String> sizesNames = sizesModels.map((size)=>size.name!).toList();
   return sizesNames.join(', ');
  }

  bool check(){
          if(!formKey.currentState!.validate()){
      return false;
    }else if(selectedCategory == null){
     Get.showSnackbar(const GetSnackBar(message: "Choose a category", 
        duration: Duration(milliseconds: 1200),));
    }else if(file == null && image == null){
        Get.showSnackbar(const GetSnackBar(message: "Choose an image", 
        duration: Duration(milliseconds: 1200),));
    }else{
      return true;
    }
    return false;
  }

    save() async{
      if(check()){
      List<ExtraModel> extras = selectedExtras.map((extra)=>AllData().extras.firstWhere((checkedExtra)=>checkedExtra.id == extra.id)).toList();
      List<int> extrasIds = extras.map((extra)=> extra.id!).toList();
      await itemsData.updateItem(item.id!, name.text, description.text, selectedCategory!.id, active ? 1 : 0, 
      extrasIds, item.image!, file);
      await homeData.getAllData();
      event();
    } 
  }


  next(){
      if(check()){
    item.category = selectedCategory!.id;
    item.description = description.text;
    item.name = name.text;
    item.active = active ? 1 : 0;
    List<SizeModel> sizes = selectedSizes.map((size)=>AllData().sizes.firstWhere((checkedSize)=>checkedSize.id == size.id)).toList();
    List<ExtraModel> extras = selectedExtras.map((extra)=>AllData().extras.firstWhere((checkedExtra)=>checkedExtra.id == extra.id)).toList();
    Get.toNamed(AppRoutes.priceInformation, arguments: {"event" : event, "item" : item, "sizes" : sizes, "extras" : extras, "file" : file});
    } 
  }


}