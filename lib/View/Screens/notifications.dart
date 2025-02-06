



import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/notification_card.dart';
import 'package:fasty_admin/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends GetView<NotificationController> {
    const Notifications({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return GetBuilder<NotificationController>(
      builder: (controller) {
        return Scaffold( 
      floatingActionButton: floatingButton(()async { await controller.send();}, 
      controller.statusRequest == StatusRequest.sucsses, ),    
          body:HandlingRequestView(update: ()async{await controller.getData();}, 
          statusRequest: controller.statusRequest, widget: SafeArea(
            child: authPadding(
              ListView(children: [ textBackButtonAppBar(context, "Notifications"),
              const SizedBox(height: 15),
              ListView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.notifications.length,
              itemBuilder: (context, i)=>NotificationCard(notification: controller.notifications[i],),

              ) 
                          ],), 
                         
                          ),
          ),)
        );
      }
    );
  }

}