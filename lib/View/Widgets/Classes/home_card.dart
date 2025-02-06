  

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeCard extends StatelessWidget {
  final String name;
  final String image;
  final void Function() onPressed;
  const HomeCard({super.key, required this.image, required this.onPressed, required this.name});
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)),
        elevation: 2.5,
        child: InkWell(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
          borderRadius: BorderRadius.circular(4),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(image, width: 60, height: 60,),
              const SizedBox(height: 7,),
              AutoSizeText(maxLines: 1, name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
            ],),
          )
        ),
      );
  }



}

  
  
  
  
