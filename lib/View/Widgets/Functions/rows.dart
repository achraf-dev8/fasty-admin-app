
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Screens/bottomSheets/filter_bottom_sheet.dart';
import 'package:fasty_admin/View/Widgets/Classes/search_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


Widget searchRow(String text, String bottomSheetText, void Function(String) search, void Function() filter, double fontSize, double iconSize, bool? numiric, 
List<String> filterNames, String filterTitle){
  return Row(
                children: [
                  Expanded(
                    child:  SearchTextfeild(search: search, fontSize: fontSize, numiric: numiric, text: text,),
                  ), 
                   IconButton(icon:  Icon
                  (FontAwesomeIcons.filter, size: iconSize, color: AppColors.textFieldDarkGrey,), 
                  onPressed: (){Get.bottomSheet(FilterBottomSheet(onPressed: filter, filterNames : filterNames, 
                  filterTitle: filterTitle, text: bottomSheetText,), 
                  enableDrag: true);},)
                ],
              );
}