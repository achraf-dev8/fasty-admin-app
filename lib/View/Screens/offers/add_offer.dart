

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/dropdown_list.dart';
import 'package:fasty_admin/controller/offers/add_offer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddOffer extends GetView<AddOfferController> {
  const AddOffer({super.key});

  @override
  Widget build(BuildContext context) {
      Get.lazyPut(()=>AddOfferController());
    return 
         Scaffold( 
          body: GetBuilder<AddOfferController>(
            builder: (controller) => SafeArea(
                  child: 
                    authPadding(
                      ListView(children: [
                        textBackButtonAppBar(context, controller.offer == null ? "Add Offer" : "Edit Offer"),
                        const SizedBox(height: 22,), controller.file != null ?
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                             child: Image.file(controller.file!, fit: BoxFit.fill, height : 170, width: 255,
                             
                             )),
                        ) : controller.image != null ? Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect( borderRadius: BorderRadius.circular(20.0),
                            child: CachedNetworkImage(
                                        imageUrl: "${ApiLinks.offersUploadLink}/${controller.image}",
                                        errorWidget: (context, url, error) =>
                                         const Text("Failed to load image", style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                                        fit: BoxFit.fill,
                                        height : 140, width :360, maxHeightDiskCache: 240, maxWidthDiskCache: 510
                                      ),
                          ),
                        ) : const SizedBox(),
                        chooseImage("160 X 340", (){controller.chooseFile();}), const SizedBox(height: 18,), 
                      Row(
                        children: [
                         const Text("Clickable",
                            style:  TextStyle(
                              color: AppColors.black,
                              fontSize: 23, ), ), const Spacer(),
                          Switch(value: controller.isClickable, onChanged: (val){controller.changeClickable(val);},
                          activeColor: AppColors.blue, inactiveThumbColor: AppColors.mediumGrey,
                          ),
                        ],
                      ), Visibility(
                        visible: controller.isClickable,
                        child: Column(
                          children: [
                            const SizedBox(height: 16,), DropdownList(text: controller.offerFilter, 
                            onPressed: (){controller.toFilterBottomSheet();}),
                            const SizedBox(height: 16,), 
                            DropdownList(text: controller.selectedItem != null ? controller.selectedItem!.name : 
                            "Select ${controller.offerFilter}", 
                            onPressed: (){controller.toItemSelect();}),
                            const SizedBox(height: 10,)
                          ],
                        ),
                      ), 
                     const SizedBox(height: 15,), nextButton((){controller.confirm();}, "Confirm")
                ]),
                ),
                      )
          ));}
}
