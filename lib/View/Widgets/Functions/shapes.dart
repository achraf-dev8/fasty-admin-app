  import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget circle(Widget widget, double size, EdgeInsetsGeometry? margin, Color color){
    return Container( 
      margin:  margin,
      width: size,
      height: size,
      decoration: BoxDecoration(
       color:color,
       shape: BoxShape.circle,
       ),
       child: widget,
       );
  }
  Widget greyCircle(IconButton iconButton, double size, EdgeInsetsGeometry? margin){
    return circle(iconButton, size, margin, AppColors.circleGrey);
  }

  Widget socialMediaCircle(IconData icon, bool isLast){

    return greyCircle(IconButton(onPressed: (){}, icon: Icon(icon, size: 31, color: AppColors.black,)), 
    60, EdgeInsets.only(right : !isLast ? 26 : 0));
    
  }

  Widget selectingCircle(void Function() onPressed, bool selected){
    return Container( alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: !selected ? AppColors.white : AppColors.organgeYellow,
                  shape: BoxShape.circle,
                border: Border.all(color: !selected ? AppColors.black : AppColors.organgeYellow, width: 1.5),
                ),
                child: IconButton(icon: Icon(!selected ? null : FontAwesomeIcons.check, color: AppColors.white,
                size: 14), onPressed: onPressed,),
              );
  }

