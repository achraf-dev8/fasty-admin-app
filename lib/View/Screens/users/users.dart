



import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/search_textfeild.dart';
import 'package:fasty_admin/View/Widgets/Classes/user_card.dart';
import 'package:fasty_admin/controller/users/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Users extends GetView<UsersController> {
  const Users({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> UsersController());
    return Scaffold(
      body:
        GetBuilder<UsersController>( builder: (controller) =>
          HandlingRequestView( statusRequest: controller.statusRequest, update: ()async{await controller.getData();},
            widget: authPadding(
              ListView(children: [
                  textBackButtonAppBar(context, "Users"),
                   const SizedBox(height: 8,),
                   SearchTextfeild(search: (val){controller.search(val);}, fontSize: 16, text: controller.searchText),
                  const SizedBox(height: 12,),
                  
                    ListView.builder(
                      shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                     itemCount: controller.searchedUsers.length,
                  itemBuilder: (context, i) => UserCard(user: controller.searchedUsers[i], 
                  ban:()async{await controller.ban(controller.searchedUsers[i].id!);},)
                  ), const SizedBox(height: 20,)
                
                  ],),
             ),
          )),);
            
              
  }

}