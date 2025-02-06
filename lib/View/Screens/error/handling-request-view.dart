

import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Constant/images.dart';
import 'package:fasty_admin/View/Screens/error/offline_screen.dart';
import 'package:fasty_admin/View/Screens/error/server_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingRequestView extends StatelessWidget {
  final Widget widget;
   final StatusRequest statusRequest;
   final void Function() update;
   const HandlingRequestView({super.key, required this.widget, required this.statusRequest, required this.update});
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading? Center(child: Lottie.asset(AppImages.loadingImage, width: 260, height: 270)):
    statusRequest == StatusRequest.offlinefailure? OfflineScreen(update: update) :  
    statusRequest == StatusRequest.serverfailure? ServerErrorScreen(update: update): widget;
  }

}