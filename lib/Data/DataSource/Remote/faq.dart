import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class FaqData{
  Crud crud;
  FaqData(this.crud);

  showFaq() async{
  return await crud.postRequest(ApiLinks.showFaq, {});}

  deleteFaq(int id) async{
    return await crud.postRequest(ApiLinks.deleteFaq, {
    "id" : id.toString()
    });
  }

  addFaq(String question, String answer) async{
  return await crud.postRequest(ApiLinks.addFaq, {
  "question" : question, "answer" : answer
    });
}

  updateFaq(int id, String question, String answer) async{

      return await crud.postRequest(ApiLinks.updateFaq, { "id" : id.toString(),
  "question" : question, "answer" : answer
    });
  }

}