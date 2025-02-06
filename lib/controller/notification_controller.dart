
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/notifications.dart';
import 'package:fasty_admin/Data/Model/notification_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{

  NotificationsData notificationsData = NotificationsData(Get.find());
  List<NotificationModel> notifications = [];
  StatusRequest statusRequest = StatusRequest.sucsses;
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  
  @override
  void onInit()async{
    await getData();
    super.onInit();
  }

     getData() async{
    notifications = [];
    if(statusRequest != StatusRequest.loading){
    statusRequest = StatusRequest.loading;
    update();
    }
    var response = await notificationsData.showNotifications();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      for(int i=0; i<response["notifications"].length ; i++){
        notifications.insert(0, NotificationModel.fromJson(response["notifications"][i]));
      }
    }
    update();
  }

  send(){
    sendNotification(title, body, ()async{await confrimSend();});
  }
  confrimSend()async{
    Get.back();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData.sendNotification(title.text, body.text);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      await getData();
    }else{
      update();
    }
  }

  }
  



