
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/users.dart';
import 'package:fasty_admin/Data/Model/user_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:get/get.dart';

class UsersController extends GetxController{
  UsersData usersData = UsersData(Get.find());
  String searchText = "";
  List<UserModel> users = [];
  List<UserModel> searchedUsers = [];
  StatusRequest statusRequest = StatusRequest.loading;

     @override
  void onInit() async{
    await getData();
    super.onInit();
  }

  getData()async{
    
    if(statusRequest != StatusRequest.loading){
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await usersData.showUsers();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      users = [];
      for(int i=0; i<response["users"].length ; i++){
        users.add(UserModel.fromJson(response["users"][i]));
      }
      search(searchText);
    }
    update();
  }

  ban(int id){
    orderDialog("Are you sure you want to ban this user?", ()async{await confirmBan(id);});
  }

  confirmBan(int id)async{
   statusRequest = StatusRequest.loading;
   update();
   Get.back();
    var response = await usersData.banUser(id);
    statusRequest = handlingData(response);
   if(statusRequest == StatusRequest.sucsses){
        getData();
    }else{
      update();
    }
  }
      search(String val){
    searchText = val;
    if(val == ""){searchedUsers = users;}
    else{
      int? number = int.tryParse(searchText);
  if(number != null){
      searchedUsers = [];
      UserModel? user = users.firstWhereOrNull((user)=>user.id == number);
      user != null ? searchedUsers.add(user): null;
  }else{
  searchedUsers = users.where((user) => "${user.lastName} ${user.firstName}".toLowerCase().contains(val.toLowerCase())).toList();
  }

    }
    update();
  }


}