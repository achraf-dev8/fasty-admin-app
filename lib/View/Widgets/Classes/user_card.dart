

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Core/Constant/routes_names.dart';
import 'package:fasty_admin/Data/Model/user_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UserCard extends StatelessWidget {

   final UserModel user;
   final Function() ban;

  const UserCard({super.key, required this.user, required this.ban});
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
          borderRadius: BorderRadius.circular(10), onTap: (){Get.toNamed(AppRoutes.userOrders, arguments: user.id);},
          child: Container(
            
            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical : 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("User Number : #${user.id}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19.5),),
              const Divider(color: AppColors.softGrey,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                Text("${user.lastName} ${user.firstName}",
                style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
               Text(user.phoneNumber!.isNotEmpty ? "Phone Number : ${user.phoneNumber}" : "No Phone number", style: const TextStyle(fontSize: 20)),
               Text(user.email!.isNotEmpty ? "Email : ${user.email}" : "No Email", style: const TextStyle(fontSize: 20)),
               Text("Created ${user.creationDate}", style: const TextStyle(fontSize: 20)),
               const SizedBox(height: 7,),
               orderButton(AppColors.lightRed, "Ban", () async { await ban();}),
              ],)
                   
          ]),
        ),
      ));
  }

}