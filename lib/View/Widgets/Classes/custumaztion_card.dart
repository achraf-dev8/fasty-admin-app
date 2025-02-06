import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustumaztionCard extends StatelessWidget {
  final String name;
  final String desc;
  final void Function()? onPressed;
  final void Function() delete;
  final void Function() edit;
  const CustumaztionCard({super.key, required this.name, required this.desc, required this.delete, 
  required this.edit, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Card(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: InkWell(
            overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child:  Expanded(
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 6.5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: const TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 11),
                          Text(desc, style: const TextStyle(fontSize: 17, color: AppColors.textFieldDarkGrey),)
                        ],
                                  ),
                      ), Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(icon: const Icon(FontAwesomeIcons.trash, color: AppColors.darkGrey, size: 18,), 
                        onPressed: delete,),
                        IconButton(icon: const Icon(FontAwesomeIcons.pen, color: AppColors.darkGrey, size: 18,), 
                        onPressed: edit,),
                       
                      ],
                                ),
                    ],
                  ),
                ),
          ),
        )),
    );
  }
}