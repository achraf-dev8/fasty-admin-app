

import 'dart:async';

import 'package:fasty_admin/Data/Model/category_model.dart';
import 'package:fasty_admin/Data/Model/extra_model.dart';
import 'package:fasty_admin/Data/Model/item_extra_model.dart';
import 'package:fasty_admin/Data/Model/item_model.dart';
import 'package:fasty_admin/Data/Model/item_size_model.dart';
import 'package:fasty_admin/Data/Model/offer_model.dart';
import 'package:fasty_admin/Data/Model/size_model.dart';

class AllData {
  static final data = AllData._internal();

  factory AllData() {
    return data;
  }

  AllData._internal();

  List<CategoryModel> categories = [];
  List<ItemModel> items = [];
  List<ExtraModel> extras = [];
  List<SizeModel> sizes = [];
  List<ItemExtraModel> itemExtras = [];
  List<ItemSizeModel> itemSizes = [];
  
  void restart(){
  items = [];
  categories = [];
  extras = [];
  sizes = [];
  itemExtras = [];
  itemSizes = [];
  }


}