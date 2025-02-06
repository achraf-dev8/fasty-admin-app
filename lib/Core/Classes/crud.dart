


import 'dart:async';
import 'dart:io';
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:path/path.dart";
import 'package:get/get.dart';

    final String basicAuth = 'Basic ${base64Encode(utf8.encode(
        'achraf:achraf08/'))}';

    Map<String, String> myheaders = {
          'authorization': basicAuth
        };

class Crud{
    postRequest(String url, Map<String, String> data) async{

          if(await checkInternet()){
      try{
       var response = await http.post(Uri.parse(url), body : data, headers: myheaders).timeout(const Duration(seconds: 6));
      if(response.statusCode == 200 || response.statusCode == 201){
        
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }else{
       Get.defaultDialog(title :response.body);
        return StatusRequest.serverfailure;
      }
    } on TimeoutException {
        return StatusRequest.serverfailure;
      } 
    catch(e){
      
      //var response = await http.post(Uri.parse(url), body : data, headers: myheaders).timeout(const Duration(seconds: 6));
     Get.defaultDialog(middleText :e.toString());
    
      return StatusRequest.serverfailure;
      }
      }else{
        return StatusRequest.offlinefailure;
      }}
      
  postRequestWithFile(String url, Map<String, String> data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile("files", stream, length,
        filename: basename(file.path));
    request.headers.addAll(myheaders) ; 
    request.files.add(multipartFile);
    data.forEach((key, value) {
        request.fields[key] = value ; 
    });
    var myrequest = await request.send();

    
         if(await checkInternet()){
      try{
        var response = await http.Response.fromStream(myrequest) ; 
      if(response.statusCode == 200 || response.statusCode == 201){
        
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }else{
        return StatusRequest.serverfailure;
      }
    } on TimeoutException {
        return StatusRequest.serverfailure;
      } 
    catch(e){
      return StatusRequest.serverfailure;
      }
      }else{
        return StatusRequest.offlinefailure;
      }

  }
  
}
