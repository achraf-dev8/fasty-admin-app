
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/checkinternet.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/orders/order_details.dart';
import 'package:fasty_admin/Data/Model/cart_extra_model.dart';
import 'package:fasty_admin/Data/Model/cart_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController{
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<CartModel> cart = [];
  List<CartExtraModel> cartExtras = [];
  List<String> extras = [];
  bool ready = true;

    updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }

  @override
    void onInit() async{
    await updateStatusRequest();
    super.onInit();
  }

    @override
    void onReady() async{
    int  order = 0;
   // int order = Get.arguments;
     
    var response = await orderDetailsData.postData(order);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      for(int i=0; i<response["cart_extra"].length ; i++){
        cartExtras.add (CartExtraModel.fromJson(response["cart_extra"][i]));
      }

      for(int i=0; i<response["cart"].length ; i++){
        cart.add (CartModel.fromJson(response["cart"][i]));
        extras.add(getExtras(i));
      }
    }
    update();
    super.onReady();
  }
  
    String getExtras(int i){

   List<CartExtraModel> itemCartExtras = cartExtras.where((cartExtra) => cartExtra.cart == cart[i].id).toList();
   if(itemCartExtras.isEmpty)return "";
   List<String> extrasNames = cartExtras.map((extra)=>extra.extraName!).toList();
   return extrasNames.join(', ');
  }



}