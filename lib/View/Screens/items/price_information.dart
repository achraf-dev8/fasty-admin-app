import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/item_size_card.dart';
import 'package:fasty_admin/controller/food/price_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PriceInformation extends GetView<PriceInfoController> {
  const PriceInformation({super.key});

  @override
  Widget build(BuildContext context) {
      Get.lazyPut(()=>PriceInfoController());
    return  Scaffold( 
          body: GetBuilder<PriceInfoController>(
            builder: (controller) => SafeArea(
                  child: 
                   // HandlingRequestView( statusRequest: controller.statusRequest, update: (){}, widget: 
                  authPadding(
                        Form(key: controller.formKey,
                          child: ListView(children: [
                          textBackButtonAppBar(context, "Price Information"),
                          const SizedBox(height: 6,),
                          ListView.builder( physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true, itemCount: controller.sizes.isNotEmpty ? controller.sizes.length : 1,
                            itemBuilder: (context, i)=>
                           ItemSizeCard(oldPriceController: controller.oldPrices[i], priceController: controller.prices[i],
                          size:  controller.sizes.isNotEmpty ? controller.sizes[i].name! : null, validOldPrice: controller.validOldPrices[i],
                          item: controller.item.name!, main: controller.main == i, onPressed: (val){controller.changeMain(i);}, only : controller.sizes.isEmpty
                          ), ), const SizedBox(height: 12,),
                          nextButton(()async { await controller.confirm();}, "Confirm"), const SizedBox(height: 10,)
                                               
                                          ]),
                        ),
                                      ),
                  //  ),
                      )
          ));}
    
}
