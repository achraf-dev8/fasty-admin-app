
import 'package:fasty_admin/Data/Model/order_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/appbars.dart';
import 'package:fasty_admin/View/Widgets/Functions/rows.dart';
import 'package:fasty_admin/View/Widgets/Classes/order_card.dart';
import 'package:fasty_admin/View/Widgets/Functions/paddings.dart';
import 'package:fasty_admin/View/Widgets/Classes/search_textfeild.dart';
import 'package:flutter/material.dart';


class Orders extends StatelessWidget {
 
  final String title;
  final List<OrderModel> orders;
  final bool? showFilter;
  final void Function() filter;
  final void Function(String) search;
  final Future<void> Function(OrderModel) approve;
  final Future<void> Function(OrderModel) disapprove;
  final List<String>? filterNames;
  final String? filterTitle;
  final String text;
  const Orders({super.key, required this.title, required this.orders, required this.approve, required this.disapprove,
  required this.search, this.showFilter, required this.filter, this.filterNames, this.filterTitle, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: 
          ListView(children: [
            authPadding(Column(
              children: [ 
                textBackButtonAppBar(context, title),
                const SizedBox(height: 11,),
               showFilter == null ? SearchTextfeild(search: search, fontSize:  16.25, numiric: true, text: text,) :
               searchRow(text, "Show", search, filter, 16.25, 27.5, true, filterNames ?? [], filterTitle ?? "currentOrderFilter")
              ],
            )),
            const SizedBox(height: 11,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: orders.length,
                itemBuilder: (context, i) => OrderCard(order: orders[i], approve: approve, disapprove: disapprove,),),
            ), const SizedBox(height: 20,)
          ],),
      ); 
    }
}
