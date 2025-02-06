

import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/review_card.dart';
import 'package:fasty_admin/controller/reviews_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Reviews extends GetView<ReviewsController> {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
      Get.lazyPut(()=>ReviewsController());
    return GetBuilder<ReviewsController>(
      builder: (controller) =>
         Scaffold(  
          body: SafeArea(
              child: 
                HandlingRequestView( statusRequest: controller.statusRequest, update: (){controller.getData();},
                  widget: authPadding( 
                    ListView(children: [
                    
                      textBackButtonAppBar(context, "Reviews") ,   
                    const SizedBox(height: 13,),
                    ListView.builder(physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.reviews.length,
                      itemBuilder: (context, i) => ReviewCard(review: controller.reviews[i], 
                      delete: (){controller.delete(controller.reviews[i]);}, item: controller.getItemName(controller.reviews[i])),), 
                      const SizedBox(height: 20,)
                  ],)),
                ),
            ),
        )
    ); 
    }
}
