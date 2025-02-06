class ReviewModel {
  int? id;
  int? item;
  int? user;
  String? comment;
  int? rating;
  String? name;
  String? date;

  ReviewModel({this.id, this.item, this.comment, this.rating, this.name, this.user, this.date});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    user = json['user'];
    comment = json['comment'];
    rating = json['rating'];
    name = json['name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['item'] = item.toString();
    data['user'] = user.toString();
    data['comment'] = comment;
    data['rating'] = rating.toString();
    data['name'] = name;
    data['date'] = date;
    return data;
  }
}
