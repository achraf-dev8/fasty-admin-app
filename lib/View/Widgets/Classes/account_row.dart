  

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

class AccountRow extends StatelessWidget {
  final String name;
  final IconData icon;
  final void Function() onTap;
  const AccountRow({
    super.key,
  required this.name,
  required this.icon,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        overlayColor: WidgetStateProperty.all<Color>(AppColors.circleGrey),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.only(left:25, top: 17.25, bottom: 17.25),
          child: Flexible(
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [Icon(icon, size: 28.5,), const SizedBox(width: 30,), Text(name, style: const TextStyle(fontSize: 20.5),)],),
          ),
        ),
      ),
    );
  }
  }

  
  
  
  
