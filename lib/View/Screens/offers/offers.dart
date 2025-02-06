
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Classes/offer_card.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/controller/offers/offers_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class Offers extends GetView<OfferController> {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
      Get.lazyPut(()=>OfferController());
    return GetBuilder<OfferController>(
      builder: (controller) =>
         Scaffold(floatingActionButton: floatingButton(() {controller.toAdd(null);}, 
         controller.statusRequest == StatusRequest.sucsses,),    
          body: SafeArea(
              child: 
                HandlingRequestView( statusRequest: controller.statusRequest, update: (){controller.getData();},
                  widget: ListView(children: [
                    authPadding(
                     Row(
                             children: [
                              backIconButton(21, 40),
                              const SizedBox(width:12), const Text("Offers", style: TextStyle(color: AppColors.black, 
                              fontSize: 23, fontWeight: FontWeight.bold),), const Spacer(),
                              customClickButton(()async{await controller.saveOrder();}, "Save Order", 40, 130, 17)
                             ],
                           ),
                    ),      
                    const SizedBox(height: 13,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.offers.length,
                        itemBuilder: (context, i) => Row(
                          children: [
                            Column(children: [
                              IconButton(onPressed: i==0 ? null : (){controller.upOrder(i);}, 
                              icon:  Icon(FontAwesomeIcons.solidArrowAltCircleUp, size: 26,
                              color: i==0 ? AppColors.softGrey : null
                              )),
                              const SizedBox(height: 5,),
                              IconButton(onPressed: i==controller.offers.length-1 ? null : (){controller.downOrder(i);}, 
                              icon:  Icon(FontAwesomeIcons.solidArrowAltCircleDown, size: 26,
                              color: i==controller.offers.length-1 ? AppColors.softGrey : null
                              ))
                            ],),
                            OfferCard(delete: (){controller.delete(controller.offers[i]);}, 
                            offer: controller.offers[i], number: i+1, onPressed: (){controller.toAdd(controller.offers[i]);},),
                          ],
                        ),),
                    ), const SizedBox(height: 20,)
                  ],),
                ),
            ),
        )
    ); 
    }
}
