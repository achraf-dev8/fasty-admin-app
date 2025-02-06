

import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/home.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:fasty_admin/main.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

    HomeData homeData = HomeData(Get.find());
    StatusRequest statusRequest = StatusRequest.loading;

   @override
  void onInit() async{
    await getData();
    super.onInit();
  }

   getData() async{
    statusRequest = await homeData.getAllData();
    update();
  }

  toPage(String routeName){
    Get.toNamed(routeName);
    update();
  }

    logOut()async{
    orderDialog("Are you sure you want to log out?", (){confirmLogin();});


    }

    confirmLogin()async{
  sharedPrefs.setInt("id", -1);
    Get.offAllNamed(AppRoutes.login);
    }

}