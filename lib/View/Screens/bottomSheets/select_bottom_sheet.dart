

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Data/Model/simple_model.dart';
import 'package:fasty_admin/View/Screens/error/handling-request-view.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:fasty_admin/View/Widgets/Classes/bottom_sheete_row.dart';
import 'package:fasty_admin/View/Widgets/Classes/search_textfeild.dart';
import 'package:fasty_admin/controller/bottomSheets/select_bottom_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SelectBottomSheet extends GetView<SelectBottomController> {
  final String text;
  final void Function(dynamic) onPressed;
  final List<SimpleModel> items;
  final int? selectedId;
  final List<int>? selectedIds;
  final String? customaztionName;
   final dynamic Function()? add;
  const SelectBottomSheet({
    super.key, required this.text,
    required this.onPressed, required this.items, this.selectedId, this.customaztionName, this.selectedIds, this.add
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SelectBottomController());
    controller.items = items;
    controller.selectedId = selectedId;
    controller.selectedIds = selectedIds;
    controller.add = add;
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
                  height: 4.25,
                  margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 165),
                  decoration: BoxDecoration(
                    color: AppColors.softGrey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
             Padding(
              padding:  const EdgeInsets.only(left: 22, right: 22, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                     children: [
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child:  Text(
                          text,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                     ), const Spacer(), Visibility(visible: customaztionName != null,
                      child: customClickButton((){controller.adFunction(customaztionName!,(){return add!();} );}, "Add", 40, 80, 17))
                     ],
                   ),
                  const SizedBox(height: 10),
                  SearchTextfeild(search: (val){controller.search(val);}, fontSize: 15.5, text: ""),
                  const SizedBox(height: 10),
                  GetBuilder<SelectBottomController>(
                    builder: (controller) =>
                     HandlingRequestView( statusRequest: controller.statusRequest, update: (){},
                       widget: Container( constraints: const BoxConstraints(maxHeight: 250),
                         child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.searchedItems.length,
                          itemBuilder: (context, i)=>
                          BottomSheeteRow(name: controller.names[i], 
                          onPressed: () { controller.onChange(i);},
                          isSelected: controller.isSelected(i) , selectedIcon: FontAwesomeIcons.check,)
                          ),
                       ),
                     )
                  ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 45,
                    width: 300,
                    child: OutlinedButton(
                      onPressed: (){ controller.save(); 
                        onPressed(controller.onPressedReturn());
                      }, 
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.organgeYellow,
                              side: const BorderSide(color: AppColors.organgeYellow, width: 2),
                            ), child: const Text("Save", 
                            style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
                  ),
                ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
