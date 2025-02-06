import 'dart:io';

import 'package:fasty_admin/Core/Classes/statuts_request.dart';

 checkInternet() async{
 
try{
  return true;
  var result = await InternetAddress.lookup("google.com");
  if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
    return true;
  }else{
    return false;
  }
}on SocketException catch(_){
  return false;
}
}

 checkInternetFull() async{
  return await checkInternet() ?  StatusRequest.sucsses : StatusRequest.offlinefailure;
}