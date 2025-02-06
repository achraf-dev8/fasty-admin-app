

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class UsersData{
  Crud crud;
  UsersData(this.crud);

  showUsers() async{
  return await crud.postRequest(ApiLinks.usersShow, {});}

  banUser(int id) async{
    return await crud.postRequest(ApiLinks.usersBan, {
    "id" : id.toString()
    });
  }

  showOrders(int id) async{
    return await crud.postRequest(ApiLinks.usersOrders, {
    "id" : id.toString()
    });
  }

}