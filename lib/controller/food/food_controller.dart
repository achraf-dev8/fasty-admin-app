
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Core/Functions/get_item_info.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/alldata.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/home.dart';
import 'package:fasty_admin/Data/DataSource/Remote/items.dart';
import 'package:fasty_admin/Data/Model/item_model.dart';
import 'package:fasty_admin/Data/Model/item_size_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:fasty_admin/main.dart';
import 'package:get/get.dart';

class FoodController extends GetxController{


  HomeData homeData = HomeData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  String searchText = "";
  List searchedshowedItems = [];
  List showedItems = [];
  String itemsFilter = sharedPrefs.getString("itemsFilter")!;
  bool firstDelete = true;


     @override
  void onInit() async{
    filter();
    statusRequest = StatusRequest.sucsses;
    update();
    super.onInit();
  }



        delete(ItemModel item) async{
          if(firstDelete){
            deleteDialog("Are you sure you want to delete this item?", ()async{await confirmDelete(item);});
          }else{
            await confirmDelete(item);
          }
          
  }

    confirmDelete(ItemModel item) async{
    statusRequest = StatusRequest.loading;
    update();
        if(firstDelete){
      Get.back();
    }
    var response = await itemsData.deleteItem(item.id!, item.image!);
    statusRequest = handlingData(response);
    if(StatusRequest.sucsses == statusRequest){
      await homeData.getAllData();
      filter();
      firstDelete = false;
    }
    update();
  }

    String getExtrasNames(int i){
    ItemModel item = getItem(i);
    return globalGetExtrasNames(item);
  }

      String getSizesNames(int i){
   
   if(itemsFilter ==  "Item-Sizes"){
    ItemSizeModel itemSize = searchedshowedItems[i];
    if(itemSize.main == 0){
      return "No sizes";
    }else{
      return AllData().sizes.firstWhere((size)=> size.id == itemSize.size).name!;
    }
   }
   return globalGetSizesNames(searchedshowedItems[i]);

  }
  
        ItemSizeModel? getItemSize(int i){ 
          if(itemsFilter == "Item-Sizes"){
              return searchedshowedItems[i];
          }else{
            return globalGetItemSize(searchedshowedItems[i]);
          }
      
       }

    ItemModel getItem(int i){

      if(itemsFilter == "Items"){
        return searchedshowedItems[i];
      }else{
        return AllData().items.firstWhere((checkedItem)=> checkedItem.id == searchedshowedItems[i].item);
      }
    }

    filter(){
     itemsFilter = sharedPrefs.getString("itemsFilter")!;
    if(itemsFilter == "Items"){
      showedItems = AllData().items;
    }else{
    showedItems = AllData().itemSizes;
    }  search(searchText);  
    
    }

        search(String val){
    searchText = val;
    if(val == ""){searchedshowedItems = showedItems;}
    else{
      List<ItemModel> items = AllData().items.where((item) => item.name!.toLowerCase().contains(val.toLowerCase())).toList();
      if(itemsFilter == "Items"){
        searchedshowedItems = items;
      }else{
        List<int> itemIds = items.map((item)=>item.id!).toList();
        searchedshowedItems = AllData().itemSizes.where((itemS)=>itemIds.contains(itemS.item)).toList();
      }
      
    }
    update();
  }

  toAdd(ItemModel? item){
    Get.toNamed(AppRoutes.addItem, arguments: {"event" :(){Get.offNamedUntil(AppRoutes.food, (route) => route.settings.name == AppRoutes.home,
    );} , "item" : item
    },);
  }
  
  }