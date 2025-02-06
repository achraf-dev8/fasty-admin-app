class ItemSizeModel {
  int? id;
  int? item;
  int? size;
  double? price;
  double? oldPrice;
  int? main;
 

  ItemSizeModel(
      {this.id, this.item,
      this.size, this.price,
      this.oldPrice, this.main  
      });

  ItemSizeModel.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    item  = json['item'];
    size  = json['size'];
    price = json['price'].toDouble();
    oldPrice = json['old_price'].toDouble();
    main = json['main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['item'] = item.toString();
    data['size'] = size.toString();
    data['price'] = price.toString();
    data['old_price'] = oldPrice.toString();
    data['main'] = main.toString();
    return data;
  }
}