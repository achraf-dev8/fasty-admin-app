

import 'package:fasty_admin/Core/Constant/images.dart';
import 'package:fasty_admin/View/Screens/error/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServerErrorScreen extends StatelessWidget {

    final void Function() update;
   const ServerErrorScreen({super.key, required this.update});

  @override
  Widget build(BuildContext context) {
    return ErrorScreen(update: update, title: "Something went wrong!", description: "Just retry now or later", 
    widget: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Image.asset(AppImages.serverErrorImage, height: 140, width: 140, fit: BoxFit.cover),
    ),);
  }

}