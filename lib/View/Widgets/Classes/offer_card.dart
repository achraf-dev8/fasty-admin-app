

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Data/Model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OfferCard extends StatelessWidget {
  final OfferModel offer;
  final int number;
  final void Function() delete;
  final void Function() onPressed;
  
  const OfferCard({super.key,  required this.delete, required this.number, required this.offer, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      child: Card(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          child: InkWell(
            overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Center(
              child: Expanded(
                child: Padding(
                              padding : const EdgeInsets.all(13.5),
                child: Column(
                  children: [
             Row( mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text("Offer $number", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19.5,)),
                 SizedBox(width: 110,), 
                  IconButton(icon: const Icon(FontAwesomeIcons.trash, color: AppColors.darkGrey, size: 20,), 
                          onPressed: delete,),
               ],
             ),
             const SizedBox(height: 5,),
             
                    ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: CachedNetworkImage(
            imageUrl: "${ApiLinks.offersUploadLink}/${offer.image}",
            errorWidget: (context, url, error) =>
             const Text("Failed to load image", style: TextStyle(fontSize: 16, color: AppColors.darkGrey), 
             textAlign: TextAlign.center,),
            fit: BoxFit.cover,
            height : 104, width :235
          )), 
                  ],
                ),
                                      ),
              ),
            ),
          ),
        ),
    );
  }



}