
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/offers.dart';
import 'package:fasty_admin/Data/Model/offer_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:get/get.dart';

class OfferController extends GetxController{

  OffersData offersData = OffersData(Get.find());
    List<OfferModel> offers = [];
  StatusRequest statusRequest = StatusRequest.loading;
  bool firstDelete = true;

     @override
  void onInit() async{
    await getData();
    super.onInit();
  }

     getData() async{
    if(statusRequest != StatusRequest.loading){
    statusRequest = StatusRequest.loading;
    update();
    }
    var response = await offersData.showOffers();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      List offersData = response["offers"];
      offers.addAll(offersData.map((offer) => OfferModel.fromJson(offer)));
      update();
    }else{
      update();
    }
     
  }

        delete(OfferModel offer) async{
          if(firstDelete){
            deleteDialog("Are you sure you want to delete this offer?", ()async{await confirmDelete(offer);});
          }else{
          await confirmDelete(offer);
          }
         
  }

    confirmDelete(OfferModel offer) async{
    statusRequest = StatusRequest.loading;
    update();
    if(firstDelete){
      Get.back();
    }
    
    var response = await offersData.deleteOffer(offer.id!, offer.image!);
    statusRequest = handlingData(response);
    if(StatusRequest.sucsses == statusRequest){
      offers.removeWhere((checkedOffer)=> checkedOffer.id == offer.id);
      firstDelete = false;
    }
    update();
  }

  toAdd(OfferModel? offer){
    Get.toNamed(AppRoutes.addOffer, arguments: offer);
  }

  upOrder(int i){
      var temp = offers[i];
  offers[i] = offers[i - 1];
  offers[i - 1] = temp;
  update();
  }

  downOrder(int i){
  var temp = offers[i];
  offers[i] = offers[i + 1];
  offers[i + 1] = temp;
  update(); 
  }

  saveOrder() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.orderOffer(offers.reversed.map((offer)=> offer.id!).toList());
    statusRequest = handlingData(response);
    update();
  }

}