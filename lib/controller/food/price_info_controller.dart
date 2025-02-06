

import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/alldata.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/home.dart';
import 'package:fasty_admin/Data/DataSource/Remote/items.dart';
import 'package:fasty_admin/Data/Model/extra_model.dart';
import 'package:fasty_admin/Data/Model/item_model.dart';
import 'package:fasty_admin/Data/Model/item_size_model.dart';
import 'package:fasty_admin/Data/Model/size_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceInfoController extends GetxController{

  ItemsData itemsData = ItemsData(Get.find());
  HomeData homeData = HomeData(Get.find());
  List<TextEditingController> prices = [TextEditingController()];
  List<TextEditingController> oldPrices = [TextEditingController()];
  GlobalKey <FormState> formKey = GlobalKey<FormState>();
  List<SizeModel> sizes = [];
  List<ExtraModel> extras = [];
  ItemModel item = ItemModel(name : "");
  List<String?> validOldPrices = [null];
  int main = 0;
  bool removedSizes = false;
  void Function() event = (){};


      @override
    void onReady() async{
    item = Get.arguments["item"];
    sizes = Get.arguments["sizes"];
    extras = Get.arguments["extras"];
    event = Get.arguments["event"];
    if(sizes.isNotEmpty){
    prices = List.generate(sizes.length, (_) => TextEditingController());
    oldPrices = List.generate(sizes.length, (_) => TextEditingController());
    validOldPrices = List.generate(sizes.length, (_) => null);
    }

    if(item.id != null){

      List<ItemSizeModel> itemSizes = AllData().itemSizes.where((itemS)=>itemS.item == item.id).toList();

      if(sizes.isNotEmpty){
    for(int i =0; i<itemSizes.length ;i++){
      if(sizes.map((s)=>s.id).contains(itemSizes[i].size)){
        ItemSizeModel itemSize = itemSizes[i];
        int index = sizes.indexWhere((size)=>size.id == itemSize.size);
        prices[index].text = itemSize.price.toString();
        oldPrices[index].text = itemSize.price! < itemSize.oldPrice! ? itemSize.oldPrice.toString() : "";
        main = itemSize.main == 1 ? index : main;
      }else{
        removedSizes = true;
      }
    }
    }else{
      if(itemSizes[0].main == 0){
      prices[0].text = itemSizes[0].price.toString();
      oldPrices[0].text = itemSizes[0].price! < itemSizes[0].oldPrice! ? itemSizes[0].oldPrice.toString() : "";
      }else{
        removedSizes = true;
      }

    }
    }
    
    update();
    super.onReady();
  }

  changeMain(int i){
    if(main != i){
      main = i;
      update();
    }
  }

  confirm()async{
    validOldPrices.clear();
    for(int i=0; i<prices.length ;i++){
      if(double.tryParse(oldPrices[i].text) != null && double.tryParse(prices[i].text) != null){
        validOldPrices.add(double.parse(oldPrices[i].text) > double.parse(prices[i].text) ? null : "Old price should be greater than the current"); 
      }else{
        validOldPrices.add(null);
      }
    }
    update();
    await Future.delayed(const Duration(milliseconds: 100));
    
    if(formKey.currentState!.validate()){
      List<int> mainVals = [0]; 
      List<int> sizesIds = sizes.map((size)=> size.id!).toList();
      List<int> extrasIds = extras.map((extra)=> extra.id!).toList();
      List<double> pricesVals = prices.map((price)=>double.parse(price.text)).toList();
      List<double> oldPricesVals = List.generate(pricesVals.length, (i) => double.tryParse(oldPrices[i].text) ?? pricesVals[i]);

      if(sizes.isNotEmpty){
        mainVals = List.generate(sizes.length, (i) => i == main ? 1 : 2);
      }
      if(item.id == null){
     await itemsData.addItem(item.name!, item.description!, item.category!, 1, sizesIds, mainVals, 
      pricesVals, oldPricesVals, 
      extrasIds, Get.arguments["file"]);
      }else{
   await itemsData.updateItem(item.id!, item.name!, item.description!, item.category!, item.active!, extrasIds, item.image!, Get.arguments["file"]);
       await itemsData.updateItemSizes(item.id!, sizesIds, mainVals, pricesVals, oldPricesVals);
      }
      await homeData.getAllData();
      event();  
    }
  }
}