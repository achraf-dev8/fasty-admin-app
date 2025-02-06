
import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/faq.dart';
import 'package:fasty_admin/Data/DataSource/Remote/notifications.dart';
import 'package:fasty_admin/Data/Model/notification_model.dart';
import 'package:fasty_admin/Data/Model/question_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FaqController extends GetxController{

  FaqData faqData = FaqData(Get.find());
  List<QuestionModel> questions = [];
  StatusRequest statusRequest = StatusRequest.sucsses;
  TextEditingController question = TextEditingController();
  TextEditingController answer = TextEditingController();
  
  @override
  void onInit()async{
    await getData();
    super.onInit();
  }

     getData() async{
    questions = [];
    if(statusRequest != StatusRequest.loading){
    statusRequest = StatusRequest.loading;
    update();
    }
    var response = await faqData.showFaq();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      for(int i=0; i<response["faq"].length ; i++){
        questions.insert(0, QuestionModel.fromJson(response["faq"][i]));
      }
    }
    update();
  }

  add() {
  question.clear();
  answer.clear();
  addQuestion("Add", ()async{ await confirmAdd();}, question, answer);
  }

    confirmAdd() async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await faqData.addFaq(question.text, answer.text);
    statusRequest = handlingData(response);
    if(StatusRequest.sucsses == statusRequest){
      Get.back();
      await getData();
    }
  }

      edit(int i) async{
      QuestionModel selectedQuestion = questions[i];
      question.text = selectedQuestion.question!;
      answer.text = selectedQuestion.answer!;
  await addQuestion("Edit", (){confrimEdit(selectedQuestion.id!);}, question, answer);

  }

      confrimEdit(int id) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await faqData.updateFaq(id, question.text, answer.text);
    statusRequest = handlingData(response);
    Get.back();
    if(StatusRequest.sucsses == statusRequest){
      await getData();
    }
  }

        delete(int i) {
  deleteFaq((){confrimDelete(questions[i].id!);});
  }

      confrimDelete(int id) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await faqData.deleteFaq(id);
    statusRequest = handlingData(response);
    Get.back();
    if(StatusRequest.sucsses == statusRequest){
      await getData();
    }
  }

  }
  



