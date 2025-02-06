


import 'package:fasty_admin/main.dart';
import 'package:get/get.dart';

class FilterBottomController extends GetxController{

    String filterTitle = "currentOrderFilter";
    String ordersFilter = sharedPrefs.getString("currentOrderFilter")!;

   @override
  void onReady(){
    ordersFilter = sharedPrefs.getString(filterTitle)!;
    update();
    super.onReady();
  }


    onChange(String name){
    ordersFilter = name;
    update();
    }

    save(){
    sharedPrefs.setString(filterTitle, ordersFilter);
    Get.back();
    }

}