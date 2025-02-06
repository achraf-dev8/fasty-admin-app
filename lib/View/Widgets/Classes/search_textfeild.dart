

import 'package:fasty_admin/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

class SearchTextfeild extends StatelessWidget {
  final void Function(String) search;
  final double fontSize;
  final bool? numiric;
  final String text;
  const SearchTextfeild({
    super.key,
    required this.search,
    required this.fontSize,
    this.numiric, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
                    controller: TextEditingController(text: text),
                    onChanged: search,
                    style: TextStyle(fontSize: fontSize+1),
                    keyboardType: numiric == true ? TextInputType.number : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.textFieldDarkGrey, width: 3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.organgeYellow, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      prefixIcon: const Icon(Icons.search , size: 23, color: AppColors.textFieldGrey,),
                      hintStyle: TextStyle(fontSize: fontSize, color: AppColors.textFieldGrey),
                      hintText: "Search",
                    ),     );
  }
}
