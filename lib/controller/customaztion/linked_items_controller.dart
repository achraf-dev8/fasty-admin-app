
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/home.dart';
import 'package:fasty_admin/Data/DataSource/Remote/items.dart';
import 'package:fasty_admin/Data/Model/item_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:get/get.dart';

class LinkedItemsController extends GetxController{
  List<ItemModel> items = [];
  bool firstDelete = true;
  ItemsData itemsData = ItemsData(Get.find());
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  String searchText = "";
  List <ItemModel> searchedshowedItems = [];

    @override
    void onReady() async{
    items = Get.arguments["items"];
    update();
    super.onReady();
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
      search(searchText);
      firstDelete = false;
    }
    update();
  }

    search(String val){
    searchText = val;
    if(val == ""){searchedshowedItems = items;}
    else{
        searchedshowedItems = items.where((item) => item.name!.toLowerCase().contains(val.toLowerCase())).toList();
    }
    update();
  }

    toAdd(ItemModel item, String name){
    //  Get.toNamed(AppRoutes.addOffer);
      
    Get.toNamed(AppRoutes.addItem, arguments: {"event" : (){ Get.offNamedUntil(AppRoutes.linkedItems, (route) => route.settings.name == AppRoutes.customaztion,
    arguments: {"items" : items, "name" : name});}, "item" : item });
    }

    
  

    }


