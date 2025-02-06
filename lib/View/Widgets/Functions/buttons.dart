import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Core/Functions/uploadfile.dart';
import 'package:fasty_admin/View/Widgets/Functions/shapes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget textButton(String text, void Function()? onPressed, TextStyle style){
return TextButton( style: ButtonStyle(
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.buttonSplash; 
        }
        return null; 
      },
    ),
  ),
                      onPressed: onPressed,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: style,
                      ),
                    );
}

Widget customClickButton(void Function()? onPressed, String text, double height, double width, double fontSize){
return SizedBox( height: height,
width: width,
child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(AppColors.organgeYellow),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: onPressed,
                      child: Text(text,
                        style:  TextStyle(
                          color: AppColors.white,
                          fontSize: fontSize, ), ), ),); 
}


Widget nextButton(void Function()? onPressed, String text){
return customClickButton(onPressed, text, 48, 290, 24); 
}

Widget cartIconButton(void Function() onPressed){
  return greyCircle(IconButton(icon: const Icon(FontAwesomeIcons.cartShopping, color: AppColors.brownRed, size: 18.5,),
  onPressed: onPressed,), 42, EdgeInsets.zero);}

Widget backIconButton(double iconSize, double circleSize){
  return greyCircle(IconButton(onPressed: (){Get.back();}, 
        icon:  Icon(FontAwesomeIcons.arrowLeft, size: iconSize, color: AppColors.brownRed,)), circleSize, null);}

Widget amountController(double height, double width, double iconSize, double fontSize, int amount
, void Function() minus, void Function() plus){
return Container(height: height, width: width, decoration: BoxDecoration(
                    border: Border.all(color: AppColors.softGrey, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ), 
                  child : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    IconButton(icon: Icon(FontAwesomeIcons.minus, color: AppColors.black, size: iconSize,), 
                    onPressed:minus
                     ,), Spacer(),
                     
                    Text(amount.toString(), style: TextStyle(color: AppColors.black, fontSize: fontSize),),
                  const Spacer(), IconButton(icon: Icon(FontAwesomeIcons.plus , color: AppColors.black, size: iconSize), 
                  onPressed:plus ,)
                  ],));}

Widget orderButton(Color color, String text, void Function() onPressed){
  return SizedBox( height: 40, child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(color),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        onPressed: onPressed,
                        
                        child: AutoSizeText(text,
                        maxLines: 1,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16, ), ), ),);
}

Widget floatingButton(final void Function() onPressed, bool visibility){

  return Visibility( visible: visibility,
        child: SizedBox(
          height: 50, width: 50,
          child: FloatingActionButton( 
            onPressed: onPressed,
            backgroundColor: AppColors.organgeYellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 2.0,
            child: const Icon( size: 24,
              FontAwesomeIcons.plus,
              color: AppColors.white,
            ),
          ),
        ),
      );
}

Widget chooseImage(String pixelsText, void Function() onPressed){
   return Column( crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(padding: const EdgeInsets.symmetric(horizontal: 12),  height: 48, width: 400,
                          child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(AppColors.organgeYellow),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          onPressed: onPressed,
                          icon: const Icon(FontAwesomeIcons.image, color: AppColors.white,),
                          label: const Text("Choose Image",
                            style:  TextStyle(
                              color: AppColors.white,
                              fontSize: 23, ), ), ),), const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Preferred Size : $pixelsText pixels (or same ratio)", 
                                style: const TextStyle(color: AppColors.darkGrey),),
                              )
                       ],
                     );

}