

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';
import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Data/Model/item_model.dart';
import 'package:fasty_admin/Data/Model/item_size_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/texts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemCard extends StatelessWidget {
   final ItemModel item;
   final ItemSizeModel? itemSize;
   final String sizes;
   final String extras;
   final void Function(ItemModel) delete;
   final void Function() onPressed;

  const ItemCard({super.key, required this.item, required this.sizes, required this.extras, required this.itemSize, required this.delete,
  required this.onPressed
  });
  @override
  Widget build(BuildContext context) {
     return Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: InkWell(
                      overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
            borderRadius: BorderRadius.circular(10), onTap: onPressed,
          child: Container(
            
            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical : 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                Row( 
                  children: [
                    CachedNetworkImage(
                                          imageUrl: "${ApiLinks.itemsUploadLink}/${item.image}",
                                          errorWidget: (context, url, error) =>
                                           const Text("Failed to load image", style: TextStyle(fontSize: 16), 
                                           textAlign: TextAlign.center,),
                                          fit: BoxFit.fitHeight,
                                          height : 70, width :70,
                                        ), const SizedBox(width: 6,), Expanded(
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [Container(width: 180, alignment: Alignment.topLeft,
                                                                  child: Text(
                                             item.name!,                              
                                            style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ), 
                                                                ), const SizedBox(height: 5,), Container( width: 180, alignment: Alignment.topLeft,
                                                                  child: Text(
                                            sizes,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 18.5,
                                              color: AppColors.darkGrey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                                                ), const SizedBox(height: 5,), Container( width: 180, alignment: Alignment.topLeft,
                                                                  child: Text(
                                            extras,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 17.5,
                                              color: AppColors.darkGrey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ), 
                                                                ), 
                                                            ],
                                                          ),
                                        ),  
            IconButton(onPressed: (){delete(item);}, icon: const Icon(FontAwesomeIcons.trash, color: AppColors.darkGrey, size: 21,), ),
              ],  
            ), const SizedBox(height: 10),  Row(
              children: [
               const Icon(
                      FontAwesomeIcons.solidStar,
                      color: AppColors.yellow,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                     item.rating != 0 ? item.rating!.toString() : "No ratings yet",
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.yellow,
                          fontSize: item.rating != 0 ? 18 : 17,
                        ),
                      ),
                    ), const Spacer(),  itemSize != null  ?  fullPriceInfo( 
                itemSize!.oldPrice!, itemSize!.price!, 17.5, 19) : const SizedBox(),
              ],
            ), 
            item.active == 0 ? const Column( crossAxisAlignment: CrossAxisAlignment.start,
                 children: [   SizedBox(height: 10),
                   Text("Inactive", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.red,
                          fontSize: 19,
                        ),),
                 ],
               ) : const SizedBox(),    
          ]),
        ),
      ));
  }

}