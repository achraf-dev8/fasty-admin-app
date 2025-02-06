
import 'dart:io';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Core/Functions/uploadfile.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/alldata.dart';
import 'package:fasty_admin/Data/DataSource/Remote/offers.dart';
import 'package:fasty_admin/Data/Model/offer_model.dart';
import 'package:fasty_admin/Data/Model/simple_model.dart';
import 'package:fasty_admin/View/Screens/bottomSheets/filter_bottom_sheet.dart';
import 'package:fasty_admin/View/Screens/bottomSheets/select_bottom_sheet.dart';
import 'package:fasty_admin/main.dart';
import 'package:get/get.dart';

class AddOfferController extends GetxController{

  OffersData offersData = OffersData(Get.find());
  bool isClickable = false;
  OfferModel? offer;
  List<SimpleModel> items = [];
  SimpleModel? selectedItem;
  String offerFilter = sharedPrefs.getString("offerFilter")!;
  File? file;
  String? image;

    @override
    void onReady() async{

    offer = Get.arguments;
    if(offer != null){
      if(offer!.clickable == 1){
        isClickable = true;
        offerFilter = "Food Item";
        selectedItem = SimpleModel(id: offer!.item!, name: AllData().items.firstWhere( (item) => item.id == offer!.item).name!);
      }else if(offer!.clickable == 2){
        isClickable = true;
        offerFilter = "Category";
        selectedItem = SimpleModel(id: offer!.category!, name: AllData().categories.firstWhere((category) => category.id == offer!.category).name!);
      }
      image = offer!.image;
    }
    super.onReady();
  }

  chooseFile()async{
   file =  await fileUpload();
   update();

  }

  changeClickable(bool val){
    isClickable = val;
    update();
  }

    filter(){
    bool changed = offerFilter != sharedPrefs.getString("offerFilter");
    offerFilter = sharedPrefs.getString("offerFilter")!;
    defineItems(changed);
  }

  toFilterBottomSheet(){
    Get.bottomSheet(FilterBottomSheet(onPressed: (){filter();}, filterNames : const ["Food Item", "Category"], 
    filterTitle: "offerFilter", text: "Direct to a",));
  }

    toItemSelect(){

    Get.bottomSheet(SelectBottomSheet(onPressed: (item){itemSelection(item);}, text: "Select $offerFilter", items: items, 
    selectedId: selectedItem != null ? selectedItem!.id : -1, 
      ));
  }

  defineItems(bool changed){
      if(offerFilter == "Food Item"){
      items = AllData().items.map((item)=>SimpleModel(id: item.id!, name: item.name!)).toList();
      }else{
      items = AllData().categories.map((category)=>SimpleModel(id: category.id!, name: category.name!)).toList();
      }
      if(changed){
        selectedItem = null;
      }
      update();
      }

  itemSelection(SimpleModel? item){
    selectedItem = item;
    update();
  }

  confirm()async{
    if(file == null && image == null){
      Get.showSnackbar(const GetSnackBar(message: "Choose an image", 
        duration: Duration(milliseconds: 1200),));
    }else if(selectedItem == null && isClickable){
      Get.showSnackbar( GetSnackBar(message: "Select $offerFilter", 
        duration: const Duration(milliseconds: 2000),));
    }else{
      await confirmConfirmation();
    }
  }

  confirmConfirmation()async{
    int clickable = 0;
    String directTo = "";

    if(isClickable){
      if(offerFilter == "Food Item"){
       clickable =1;
       directTo = "item";
      }else{
      clickable =2;
       directTo = "category";
      }
    }
  
  if(offer == null){
  await offersData.addOffer(clickable, directTo, selectedItem == null ? 0 : selectedItem!.id, file!);
  }else{
    await offersData.updateOffer(offer!.id!, clickable, directTo, selectedItem == null ? 0 : selectedItem!.id, offer!.image!, file);
  }
    Get.offNamedUntil(AppRoutes.offers, (route) => route.settings.name == AppRoutes.home,);  
}

}