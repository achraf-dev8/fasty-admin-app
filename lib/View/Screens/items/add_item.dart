

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Core/Functions/validator.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Functions/texts.dart';
import 'package:fasty_admin/View/Widgets/Classes/dropdown_list.dart';
import 'package:fasty_admin/View/Widgets/Classes/textfeild.dart';
import 'package:fasty_admin/controller/food/add_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddItem extends GetView<AddItemController> {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
      Get.lazyPut(()=>AddItemController());
    return  Scaffold( 
          body: GetBuilder<AddItemController>(
            builder: (controller) => SafeArea(
                  child: 
                    authPadding(
    Form( key: controller.formKey, 

                        child: ListView(children: [
                       textBackButtonAppBar(context, controller.item.id == null ? "Add Item" : "Edit Item"),
                        const SizedBox(height: 11,), 
                        Row(
                        children: [
                         const Text("Active",
                            style:  TextStyle(
                              color: AppColors.black,
                              fontSize: 23, ), ), const Spacer(),
                          Switch(value: controller.active, onChanged: (val){controller.changeActive(val);},
                          activeColor: AppColors.blue, inactiveThumbColor: AppColors.mediumGrey,
                          ),
                        ],
                      ), const SizedBox(height: 11,), 
                        TextFeild(label: "Item name", textController: controller.name, 
                        valid: (val){return validInput(val!, 3, 30, "Name", null);},), 
                        
                        const SizedBox(height: 6,),
                        
                        controller.file != null ?
                         Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                               child: Image.file(controller.file!, fit: BoxFit.fitHeight, height : 120, width: 120,
                               )),
                          ) : controller.image != null ? Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ClipRRect( borderRadius: BorderRadius.circular(20.0),
                              child: CachedNetworkImage(
                                          imageUrl: "${ApiLinks.itemsUploadLink}/${controller.image}",
                                          errorWidget: (context, url, error) =>
                                           const Text("Failed to load image", style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                                          fit: BoxFit.fitHeight,
                                          height : 120, width :120,
                                        ),
                            ),
                          ) : const SizedBox(),
                          chooseImage("300 X 300", (){controller.chooseFile();}), const SizedBox(height: 18,),
                          DropdownList(text: controller.selectedCategory == null ? "Category" : controller.selectedCategory!.name, 
                              onPressed: (){controller.toCategorySelect();}),
                              const SizedBox(height: 18,),
                          addItemSection("Sizes", controller.getSizeNames(), 21, (){controller.toSizesSelect();}),
                          const SizedBox(height: 6,),
                          addItemSection("Extras", controller.getExtrasNames(), 19, (){controller.toExtrasSelect();}),
                        const SizedBox(height: 12,),
                         TextFeild(label: "Description", textController: controller.description, valid : 
                         (val){return validInput(val!, 10, 10000, "Description", null);}, maxLines: 5,
                         minLines : 5
                         ), const SizedBox(height: 8.5,), 
                        controller.changedSizes ? nextButton((){controller.next();}, "Next") :
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [customClickButton(()async {await controller.save();}, "Save", 48, 140, 24), const SizedBox(width:10,), 
                          customClickButton(()async { await controller.next();}, "Next", 48, 140 , 24)
                          ],),  
                        const SizedBox(height: 8,),
                                        ]),
                      ),
                
                ),
                      )
          ));}
}
