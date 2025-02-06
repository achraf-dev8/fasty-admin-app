

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Widgets/Classes/bottom_sheete_row.dart';
import 'package:fasty_admin/controller/bottomSheets/filter_bottom_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends GetView<FilterBottomController> {
  
  final String text;
  final void Function() onPressed;
  final List<String> filterNames;
  final String filterTitle;
  const FilterBottomSheet({
    super.key, required this.text,
    required this.onPressed, required this.filterNames, required this.filterTitle
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FilterBottomController());
    controller.filterTitle = filterTitle;
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
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
                   Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 13),
                    child:  Text(
                      text,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  GetBuilder<FilterBottomController>(
                    builder: (controller) => Column(children: List.generate(filterNames.length, (i)=>
                      BottomSheeteRow(name :filterNames[i], onPressed: (){controller.onChange(filterNames[i]);},
                      isSelected: controller.ordersFilter == filterNames[i], selectedIcon: FontAwesomeIcons.check,)
                      ),)
                  ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 45,
                    width: 300,
                    child: OutlinedButton(
                      onPressed: (){controller.save(); onPressed();}, 
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
