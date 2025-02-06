import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Data/Model/review_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
  final Function() delete;
  final String item;

  const ReviewCard({
    super.key,
    required this.review,
    required this.delete,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Card(
        color: Colors.white, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Row( crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                 Text(review.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                const  Spacer(), Padding(
                   padding: const EdgeInsets.only(top: 2.0),
                   child: Text(
                           review.rating.toString(),
                           style: const TextStyle(
                             fontWeight: FontWeight.bold,
                             color: AppColors.yellow,
                             fontSize: 21,
                           ),
                         ),
                 ),  const Icon(
                         FontAwesomeIcons.solidStar,
                         color: AppColors.yellow,
                         size: 16.5,
                       ),
                       const SizedBox(width: 4),
                         ],
                       ), Text(Jiffy.parse(review.date!).fromNow(), style:const TextStyle(fontSize: 17, color: AppColors.darkGrey),),
                        const SizedBox(height: 6.5,),
                       Text(review.comment!, style: const TextStyle(fontSize: 17, 
                       color: AppColors.textFieldDarkGrey),),
                       Container(
                                               alignment: Alignment.bottomRight,
                                                child: textButton("Delete", () { delete(); }
                                                                               , const TextStyle(fontSize: 16, 
                                                                               color: AppColors.darkGrey)),
                                              )
            ],
          ),
        ),
      ),
    );
  }
}


/*

*/
  
  
  
  
