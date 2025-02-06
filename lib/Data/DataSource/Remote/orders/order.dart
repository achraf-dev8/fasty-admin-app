

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';


class OrderData{
  Crud crud;
  OrderData(this.crud);


  approveOrder(int id, int user) async{
    return await crud.postRequest(ApiLinks.approveOrder, {
    "id" : id.toString(),
    "user" : user.toString()
    });
  }

    disapproveOrder(int id, String msg, int user) async{
    return await crud.postRequest(ApiLinks.disapproveOrder, {
    "id" : id.toString(),
    "msg" : msg,
    "user" : user.toString()
    });
  }


}