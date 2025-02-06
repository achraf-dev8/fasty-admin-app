
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/deliveries.dart';
import 'package:fasty_admin/Data/Model/delivery_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:get/get.dart';

class DeliveriesController extends GetxController{
  DeliveryData deliveryData = DeliveryData(Get.find());
  String searchText = "";
  List<DeliveryModel> deliveries = [];
  List<DeliveryModel> searchedDeliveries = [];
  StatusRequest statusRequest = StatusRequest.loading;

     @override
  void onInit() async{
    await getData();
    super.onInit();
  }

  getData()async{
    
    if(statusRequest != StatusRequest.loading){
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await deliveryData.showDeliveries();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      deliveries = [];
      for(int i=0; i<response["deliveries"].length ; i++){
        deliveries.add(DeliveryModel.fromJson(response["deliveries"][i]));
        search(searchText);
      }
    }
    update();
  }

  delete(int id){
    orderDialog("Are you sure you want to delete this delivery?", ()async{await confirmDelete(id);});
  }

  confirmDelete(int id)async{
   statusRequest = StatusRequest.loading;
   update();
   Get.back();
    var response = await deliveryData.deleteDelivery(id);
    statusRequest = handlingData(response);
   if(statusRequest == StatusRequest.sucsses){
        getData();
    }else{
      update();
    }
  }
      search(String val){
    searchText = val;
    if(val == ""){searchedDeliveries = deliveries;}
    else{
      int? number = int.tryParse(searchText);
  if(number != null){
      searchedDeliveries = [];
      DeliveryModel? delivery = deliveries.firstWhereOrNull((delivery)=>delivery.id == number);
      delivery != null ? searchedDeliveries.add(delivery): null;
  }else{
  searchedDeliveries = deliveries.where((delivery) => delivery.name!.toLowerCase().contains(val.toLowerCase())).toList();
  }

    }
    update();
  }



}