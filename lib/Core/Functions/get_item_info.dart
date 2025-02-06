    import 'package:fasty_admin/Data/DataSource/Remote/home/alldata.dart';
import 'package:fasty_admin/Data/Model/extra_model.dart';
import 'package:fasty_admin/Data/Model/item_extra_model.dart';
import 'package:fasty_admin/Data/Model/item_model.dart';
import 'package:fasty_admin/Data/Model/item_size_model.dart';
import 'package:fasty_admin/Data/Model/size_model.dart';
import 'package:get/get.dart';

String globalGetExtrasNames(ItemModel item){

   List<ItemExtraModel> itemExtras = AllData().itemExtras.where((itemE) => itemE.item == item.id).toList();
   if(itemExtras.isEmpty)return "No extras";
   List<int> extrasIds = AllData().itemExtras.map((itemE)=> itemE.extra!).toList();
   List<ExtraModel> extras = AllData().extras.where((extra)=>extrasIds.contains(extra.id)).toList();
   List<String> extrasNames = extras.map((extra)=>extra.name!).toList();
   return extrasNames.join(', ');
  }

        String globalGetSizesNames(ItemModel item){
   
   List<ItemSizeModel> itemSizes = AllData().itemSizes.where((itemS) => itemS.item == item.id).toList();
   itemSizes.removeWhere((itemS)=> itemS.main == 0);
   if(itemSizes.isEmpty)return "No sizes";

   List<SizeModel> sizes = getSizes(itemSizes);

   List<String> sizesNames = sizes.map((extra)=>extra.name!).toList();
   return sizesNames.join(', ');
  }

  List<SizeModel> getSizes(List<ItemSizeModel> itemSizes){

   List<int?> sizesIds = itemSizes.map((itemS)=> itemS.size).toList();
   return AllData().sizes.where((size)=>sizesIds.contains(size.id)).toList();
  }

    ItemSizeModel? globalGetItemSize(ItemModel item){
    List<ItemSizeModel> itemSizes = AllData().itemSizes.where((itemS) => itemS.item == item.id).toList();
    ItemSizeModel? itemSize = itemSizes.firstWhereOrNull((itemS)=> itemS.main == 0);
    return itemSize;
  }