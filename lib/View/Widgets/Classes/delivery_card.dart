

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Data/Model/delivery_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DeliveryCard extends StatelessWidget {

   final DeliveryModel delivery;
   final Function() delete;

  const DeliveryCard({super.key, required this.delivery, required this.delete});
  @override
  Widget build(BuildContext context) {
     return Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: InkWell(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
          borderRadius: BorderRadius.circular(10), onTap: (){Get.toNamed(AppRoutes.userOrders, arguments: delivery.id);},
          child: Container(
            
            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical : 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Delivery Number : #${delivery.id}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19.5),),
              const Divider(color: AppColors.softGrey,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                Text(delivery.name!,
                style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
               Text("Phone Number : ${delivery.phoneNumber}", style: const TextStyle(fontSize: 20)),
               Text("Dropped ${delivery.dropped} orders", style: const TextStyle(fontSize: 20)),
               Text("Created ${delivery.date}", style: const TextStyle(fontSize: 20)),
               const SizedBox(height: 7,),
               orderButton(AppColors.lightRed, "Delete", () async { await delete();}),
              ],)
                   
          ]),
        ),
      ));
  }

}