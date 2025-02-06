

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class NotificationsData{
  Crud crud;
  NotificationsData(this.crud);

  showNotifications() async{
    return await crud.postRequest(ApiLinks.showNotifications, {
    });
  }

    sendNotification(String title, String body) async{
    return await crud.postRequest(ApiLinks.sendNotification, {
      "title" : title, "body" : body
    });
  }

}