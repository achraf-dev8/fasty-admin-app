
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:flutter/material.dart';


class DropdownList extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const DropdownList({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
      return Container( 
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.textFieldGrey, width: 2)
                  ),
                    child: InkWell(
                      overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
                              borderRadius: BorderRadius.circular(10), onTap: onPressed, child: 
                              Padding(
                              padding: const  EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                               child:  Expanded(
                                 child: Row(children: [Text(text,  maxLines: 1,
                                 style : const TextStyle(color: AppColors.darkGrey, fontSize: 18),),
                                 const Spacer(), const Icon(Icons.keyboard_arrow_down, color: AppColors.darkGrey)
                                 ],),
                               ),
                             ),
                              )
                  
                  ,);
    }
}
