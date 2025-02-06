
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Data/Model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailsCard extends StatelessWidget {
    final CartModel cart;
   final String extras;
  const OrderDetailsCard({super.key, required this.cart, required this.extras,
  });
  @override
  Widget build(BuildContext context) {
     return Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Flexible(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical : 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                  imageUrl: "${ApiLinks.itemsUploadLink}/${cart.image}",
                  height: 75,
                  fit: BoxFit.cover,
                    ), const SizedBox(width: 6,), Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [AutoSizeText(
                   cart.name!,
                  textAlign: TextAlign.center,
                  minFontSize: 10,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ), if(cart.size!.isNotEmpty) 
                Text(
                  cart.size!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 21,
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),],)
                  ],
                ),                 const SizedBox(height: 4), 
                if(extras.isNotEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    maxLines: 1,
                    extras,
                    minFontSize: 5,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ),
                 SizedBox(height: extras.isNotEmpty ? 10 : 0),
                Row( crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text( "${NumberFormat('#.##').format(cart.price!*cart.amount!)}\$",
                      style: const TextStyle( fontSize: 22, fontWeight: FontWeight.bold,),
                    ), const Spacer(),
                    Text( "X ${cart.amount!}",
                      style:const  TextStyle( fontSize: 24, fontWeight: FontWeight.bold,),
                    ),
                ],)      
              ],
            ),
          ),
        ),
      );
  }

}