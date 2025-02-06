

import 'package:fasty_admin/Core/Functions/validator.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Functions/text_feilds.dart';
import 'package:fasty_admin/View/Widgets/Classes/textfeild.dart';
import 'package:fasty_admin/controller/deliveries/add_delivery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddDelivery extends GetView<AddDeliveryController> {
  const AddDelivery({super.key});

  @override
  Widget build(BuildContext context) {
      Get.lazyPut(()=>AddDeliveryController());
    return 
         Scaffold( 
          body: GetBuilder<AddDeliveryController>(
            builder: (controller) => SafeArea(
                  child: 
                    authPadding(
                      Form( key: controller.formKey,
                        child: ListView(children: [
                          
                          textBackButtonAppBar(context, "Add delivery"),
                          const SizedBox(height: 55,),
                        
                          nameTextField(controller.name,),

                          phoneTextFeild(controller.phoneNumber, controller),
                        
                         passwordTextFeild("Password", controller.password, true, false,
                         controller.passwordObscureText, (){controller.passwordShowHideText();}),
                         confrimPasswordTextFeild("password", controller.confirmPassword,
                         controller.repeatObscureText, (){controller.repeatShowHideText();}, controller),
                        
                                             const SizedBox(height: 25,), nextButton((){controller.confirm();}, "Confirm")
                                        ]),
                      ),
                ),
                      )
          ));}
}
