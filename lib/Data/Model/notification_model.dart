class NotificationModel {
  int? id;
  String? title;
  String? body;
  String? date;

NotificationModel({this.id, this.title, this.body, this.date});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, String> data =  <String, String>{};
    data['id'] = id.toString();
    data['title'] = title!;
    data['body'] = body!;
    data['date'] = body!;
    return data;
  }
}