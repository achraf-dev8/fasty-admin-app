class OfferModel {
  int? id;
  String? image;
  int? clickable;
  int? item;
  int? category;

  OfferModel({
    this.id,
    this.image,
    this.clickable,
    this.item,
    this.category,
  });

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    clickable = json['clickable'];
    item = json['item'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['image'] = image;
    data['clickable'] = clickable.toString();
    data['item'] = item.toString();
    data['category'] = category.toString();
    return data;
  }
}
