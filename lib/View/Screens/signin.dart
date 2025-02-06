

import 'package:fasty_admin/Controller/signin_controller.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Core/Constant/images.dart';
import 'package:fasty_admin/Core/Functions/validator.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Functions/text_feilds.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signin extends GetView<SignInController> {
    const Signin({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> SignInController());
    return GetBuilder<SignInController>(
      builder: (controller) {
        return Scaffold( 
          body:HandlingRequestView(update: ()async{await controller.updateStatusRequest();}, statusRequest: controller.statusRequest, widget: SafeArea(
            child: authPadding(
              Form(
                key : controller.formKey,
                child: ListView(children: [ welcomeBar(context, "Welcom Back", 25),
                const SizedBox(height: 35),
                  Image.asset(
                              AppImages.logo,
                              height: 112,
                              width: 112,
                            ), 
                            
                 const Text(textAlign: TextAlign.center, "Admin App", style: TextStyle(color : AppColors.organgeYellow,
                 fontSize: 24),),
                            const SizedBox(height: 35,),
                            TextFeild(label : "Username", textController: controller.usernameController
                            , valid: (val){ return validInput(val!, 0, 30, "Username", null);},),
                      
                            passwordTextFeild("Password", controller.passwordController, false,
                            false, controller.obscureText, (){controller.showHideText();}),
                            GetBuilder<SignInController>( 
                              builder: (controller) => Visibility(visible: controller.wrongLoginInfo,
                                  child: const Column( crossAxisAlignment: CrossAxisAlignment.start,
                                    children : [
                                    SizedBox(height: 0),
                                    Text("Wrong username or password", style: TextStyle(color : AppColors.darkRed, fontSize : 14.5)),
                                    SizedBox(height: 16),
                                  ])
                                  )
                              
                            ),
                            SizedBox(height: 8),
                            nextButton(()async { 
                              await controller.login();
                              }, "Sign in"),
                            ],),
              ), 
                         
                          ),
          ),)
        );
      }
    );
  }

}