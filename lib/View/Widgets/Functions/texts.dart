


import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';



  Widget fullPriceInfo(double oldPrice, double newPrice, double firstSize, double secondSize){
    NumberFormat formatter = NumberFormat('#.##');
    String roldPrice = formatter.format(oldPrice);
    String rnewPrice = formatter.format(newPrice);
    return Row(children: [Visibility(visible: !(oldPrice == newPrice),
      child: Stack(children: [Text("$roldPrice\$", style: TextStyle( fontSize: firstSize,
                fontWeight: FontWeight.bold, color: AppColors.mediumGrey),), 
                Positioned(left: 0,right: 0,top: firstSize/1.6, child: Container( height: 1, color: AppColors.mediumGrey,),),],
             ),
    ), const SizedBox(width: 6,), Text( "$rnewPrice\$", style: TextStyle( fontSize: secondSize, fontWeight: FontWeight.bold,),
                  ),],);
  }

 Widget addItemSection(String title, String items, double size, void Function() onPressed){
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ Text(
              title,  textAlign: TextAlign.center, style: const TextStyle(
              fontSize: 19.5,  color: AppColors.black,  fontWeight: FontWeight.bold,
              ), ),

                    Row(
                      children: [
                        Flexible(
                          child: Text(
                        items, style:  TextStyle(
                                                     fontSize: size,  color: AppColors.darkGrey,  fontWeight: FontWeight.bold,
                                                     ), ),
                        ), const SizedBox(width: 10,), 
                           IconButton(icon: const Icon(FontAwesomeIcons.pen, color: AppColors.darkGrey, size: 18,), 
                        onPressed: onPressed,),
                      ],
                    ),

  ],);
 }
  

