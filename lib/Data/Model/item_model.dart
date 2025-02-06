class ItemModel {
  int? id;
  String? name;
  String? description;
  int? category;
  int? active;
  double? rating;
  String? date;
  String? image;

  ItemModel(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.active,
      this.rating,
      this.date,
      this.image});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    active = json['active'];
    rating = json['rating'].toDouble();
    date = json['date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id.toString();
    data['name'] = name;
    data['description'] = description;
    data['category'] = category.toString();
    data['active'] = active.toString();
    data['rating'] = rating.toString();
    data['date'] = date;
    data['image'] = image;
    return data;
  }
}