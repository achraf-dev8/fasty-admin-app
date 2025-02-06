


import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:fasty_admin/Core/Functions/validator.dart';
import 'package:fasty_admin/View/Widgets/Classes/textfeild.dart';
import 'package:flutter/material.dart';

class ItemSizeCard extends StatelessWidget {
  final String? size;
  final String item;
  final bool main;
  final bool only;
  final TextEditingController oldPriceController;
  final TextEditingController priceController;
  final void Function(bool) onPressed;
  final String? validOldPrice;
  
  const ItemSizeCard({super.key,  required this.size, required this.item, required this.main, required this.oldPriceController,
  required this.priceController, required this.onPressed, required this.only, required this.validOldPrice
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4.0),
      child: Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            child: Expanded(
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(  width: 200,
                        child:  Text(
                       only ? item : "$item($size)", style: const TextStyle( fontSize: 20,
                        fontWeight: FontWeight.bold,),),), 
                        const SizedBox(height: 10,),

                        TextFeild(label: "Price", textController: priceController, valid: 
                      (val){return validInput(val!, 0, 10000, "Price", null);}),


                      TextFeild(label: "Old Price", textController: oldPriceController, valid: 
                      (val){String? validVal = validInput(val!, 0, 10000, "Old Price", null);
                        if(validVal != null){
                        return validVal;
                      }else{return validOldPrice;}
                      }, space: false,),
                       const Text("Leave it empty to not have it", style: TextStyle(color: AppColors.textFieldGrey, 
                       fontSize: 12),), 
                     !only ?  Column(
                         children: [
                           const SizedBox(height: 12,),
                         Row(
                        children: [
                          const Text("Main size", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),), 
                          const SizedBox(width: 10,),
                          SizedBox(width: 20, height: 20, 
                            child: Checkbox(value: main, onChanged: (val){onPressed(val!);},
                            activeColor: AppColors.blue
                            )),
                        ],
                      )
                         ],
                       ) : const SizedBox(),

                    ],
                  ),
                ),
                      )),
    );
  }



}