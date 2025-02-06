

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/alldata.dart';
import 'package:fasty_admin/Data/Model/category_model.dart';
import 'package:fasty_admin/Data/Model/extra_model.dart';
import 'package:fasty_admin/Data/Model/item_extra_model.dart';
import 'package:fasty_admin/Data/Model/item_model.dart';
import 'package:fasty_admin/Data/Model/item_size_model.dart';
import 'package:fasty_admin/Data/Model/offer_model.dart';
import 'package:fasty_admin/Data/Model/size_model.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
 Future<StatusRequest> getAllData() async{
    var response = await crud.postRequest(ApiLinks.homeLink, {});
    StatusRequest statusRequest = handlingData(response);
    if(StatusRequest.sucsses == statusRequest){
    AllData().restart();

    for(int i=0; i<response["sizes"].length ; i++){
        AllData().sizes.insert(0, SizeModel.fromJson(response["sizes"][i]));
      }
      for(int i=0; i<response["extras"].length ; i++){
        AllData().extras.insert(0, ExtraModel.fromJson(response["extras"][i]));
      }
      for(int i=0; i<response["categories"].length ; i++){
        AllData().categories.insert(0, CategoryModel.fromJson(response["categories"][i]));
      }
     for(int i=0; i<response["item_size"].length ; i++){
        AllData().itemSizes.insert(0, ItemSizeModel.fromJson(response["item_size"][i]));
      }
      for(int i=0; i<response["item_extra"].length ; i++){
        AllData().itemExtras.insert(0, ItemExtraModel.fromJson(response["item_extra"][i]));
      }
      for(int i=0; i<response["items"].length ; i++){
        AllData().items.insert(0, ItemModel.fromJson(response["items"][i]));
      }
      }

      return statusRequest;
  }
}
