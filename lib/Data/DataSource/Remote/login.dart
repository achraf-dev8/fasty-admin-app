



import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);
  postData(String username, String password) async{
    var response = await crud.postRequest(ApiLinks.loginLink, {
      "username" : username, "password":password
    });

    return response;
  }
}