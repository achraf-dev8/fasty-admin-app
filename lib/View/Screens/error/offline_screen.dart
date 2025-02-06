

import 'package:fasty_admin/Core/Constant/images.dart';
import 'package:fasty_admin/View/Screens/error/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class OfflineScreen extends StatelessWidget {

    final void Function() update;
   const OfflineScreen({super.key, required this.update});
  @override
  Widget build(BuildContext context) {
    return ErrorScreen(update: update, title: "Oops! No connection!", description: "Check your internet connection and retry", 
    widget: Lottie.asset(AppImages.noConnectionImage, height: 200, width: 200, fit: BoxFit.cover), );
  }

}