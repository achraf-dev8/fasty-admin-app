

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';

Widget welcomeBar(BuildContext context, String text, double size){
  return Container(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(text, style:  TextStyle(color: AppColors.black, fontSize: size, fontWeight: FontWeight.bold),),
    ),
  )  ;
}

Widget textBackButtonAppBar(BuildContext context, String text){
     return Row(
       children: [
        backIconButton(21, 40),
        const SizedBox(width:12), Text(text, style: const TextStyle(color: AppColors.black, 
        fontSize: 23, fontWeight: FontWeight.bold),),
       ],
     );

     
}
