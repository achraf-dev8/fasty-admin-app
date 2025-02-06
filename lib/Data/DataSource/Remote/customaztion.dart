

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class CustomaztionData{
  Crud crud;
  CustomaztionData(this.crud);

  delete(int id, String section) async{
  return await crud.postRequest(ApiLinks.customaztionDelete, {
    "id" : id.toString(), "section" : section
  });
}

  add(String name, String section) async{
  return await crud.postRequest(ApiLinks.customaztionAdd, {
    "name" : name, "section" : section
  });
}

  update(int id, String name, String section) async{
  return await crud.postRequest(ApiLinks.customaztionUpdate, {
    "id" : id.toString(), "section" : section, "name" : name
  });
}


}