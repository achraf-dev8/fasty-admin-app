import 'dart:io';

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class OffersData{
  Crud crud;
  OffersData(this.crud);

  showOffers() async{
  return await crud.postRequest(ApiLinks.offerShow, {});}

  deleteOffer(int id, String image) async{
    return await crud.postRequest(ApiLinks.offerDelete, {
    "id" : id.toString(), "image" : image
    });
  }

  addOffer(int clickable, String directTo, int selectedItem, File file) async{
  return await crud.postRequestWithFile(ApiLinks.offerAdd, {
  "clickable" : clickable.toString(),
  "direct_to" :directTo, "selected_item" :selectedItem.toString()
    }, file);
}

  updateOffer(int id, int clickable, String directTo, int selectedItem, String oldImage, File? file) async{
  if(file != null){
    return await crud.postRequestWithFile(ApiLinks.offerUpdate, {
  "id" : id.toString(), "clickable" : clickable.toString(),
  "direct_to" :directTo, "selected_item" :selectedItem.toString(), "old_image" : oldImage
    }, file);
  }else{
        return await crud.postRequest(ApiLinks.offerUpdate, {
  "id" : id.toString(), "clickable" : clickable.toString(),
  "direct_to" :directTo, "selected_item" :selectedItem.toString(), "old_image" : oldImage
    });
  }}

    orderOffer(List<int> ids) async{
    return await crud.postRequest(ApiLinks.offerOrder, {
    "ids" : ids.toString()
    });}

}