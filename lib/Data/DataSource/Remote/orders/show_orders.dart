

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class ShowOrders{
  Crud crud;
  ShowOrders(this.crud);

  currentOrders() async{
  return await crud.postRequest(ApiLinks.currentOrders, {});
}

  shippingOrders() async{
  return await crud.postRequest(ApiLinks.shippingOrders, {});
}

  archivedOrders() async{
  return await crud.postRequest(ApiLinks.archivedOrders, {});
}

}