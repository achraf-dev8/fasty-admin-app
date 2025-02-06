class QuestionModel {

  int? id;
  String? question;
  String? answer;

QuestionModel({this.question, this.answer});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer']; id = json['id']; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id.toString();
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}