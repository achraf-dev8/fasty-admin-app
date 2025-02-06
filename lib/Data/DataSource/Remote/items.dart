

import 'dart:io';

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class ItemsData{
  Crud crud;
  ItemsData(this.crud);

  addItem(String name, String description, int category, int active, List<int> sizes, List<int> main, List<double> price, 
  List<double> oldPrice, List<int> extras, File file) async{
  return await crud.postRequestWithFile(ApiLinks.itemAdd, {
  "name" : name, "description" : description, "category" : category.toString(), "active": active.toString(), "sizes" : sizes.toString(),
  "main" : main.toString(), "price" : price.toString(), "old_price" : oldPrice.toString(), "extras" : extras.toString()
    }, file);}

    deleteItem(int id, String image) async{
    return await crud.postRequest(ApiLinks.itemDelete, {
    "id" : id.toString(), "image" : image
    });
    }

      updateItem(int id, String name, String description, int category, int active, List<int> extras, String oldImage,
       File? file,) async{
    if(file != null){
        return await crud.postRequestWithFile(ApiLinks.itemUpdate, {
  "id" : id.toString(), "name" : name, "description" : description, "category" : category.toString(), "active": active.toString(),
   "extras" : extras.toString(), "old_image" : oldImage
    }, file);}else{
        return await crud.postRequest(ApiLinks.itemUpdate, {
  "id" : id.toString(), "name" : name, "description" : description, "category" : category.toString(), "active": active.toString(),
   "extras" : extras.toString(), "old_image" : oldImage
    });}
      }


      updateItemSizes(int id, List<int> sizes, List<int> main, List<double> price, List<double> oldPrice) async{
    return await crud.postRequest(ApiLinks.itemUpdateSizes, {
    "id" : id.toString(), "sizes" : sizes.toString(),  "main" : main.toString(), "price" : price.toString(), "old_price" : oldPrice.toString(),
    });
  }


}