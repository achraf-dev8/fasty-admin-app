

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorScreen extends StatelessWidget {

    final void Function() update;
    final String title;
    final String description;
    final Widget widget;
   const ErrorScreen({super.key, required this.update, required this.title, required this.description, required this.widget});
  @override
  Widget build(BuildContext context) {
    return Center(child: Column( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(title, style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 24),),
        widget,
        Text(description, style: TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 20,),
        nextButton(update, "Retry")   ],
    ));
  }

}