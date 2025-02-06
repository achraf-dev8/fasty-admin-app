


import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

class BottomSheeteRow extends StatelessWidget {

  final String name;
  final void Function() onPressed;
  final bool isSelected;
  final IconData selectedIcon;
  const BottomSheeteRow({
    super.key, required this.name, required this.onPressed, required this.isSelected, required this.selectedIcon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent, 
        child: InkWell(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.itemClickGrey),
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          highlightColor: Colors.transparent,
          splashColor: Colors.grey.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 2,
                       name,
                        style: TextStyle(color: !(isSelected)
                         ?AppColors.black : AppColors.organgeYellow, fontSize: !(isSelected) ? 
                         19.75 : 20.5 ),
                      ),
                    ),
                    const Spacer(),
                    Visibility( visible: isSelected,
                      child: Icon(
                        selectedIcon, color: AppColors.organgeYellow,
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      );
  }}