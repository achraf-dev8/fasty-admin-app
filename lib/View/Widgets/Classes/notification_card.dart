import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Data/Model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class NotificationCard extends StatelessWidget {
  
  final NotificationModel notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      child: Card(
        color: Colors.white, // Ensure you have a color for AppColors.white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Row(
          children: [
            Text(notification.title!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5,),),
            const Spacer(),
            Text(Jiffy.parse(notification.date!).fromNow(), style:const TextStyle(fontSize: 15.25, color: AppColors.textFieldGrey),),
          ],
        ), const SizedBox(height: 12,),
         Text(notification.body!, style: const TextStyle(color: AppColors.textFieldDarkGrey, fontSize: 16.75),),
            ],
          ),
        ),
      ),
    );
  }
}


/*

*/
  
  
  
  
