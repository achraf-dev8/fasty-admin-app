class CartModel {
  int? id;
  int? user;
  int? itemSize;
  int? amount;
  int? order;
  String? size;
  double? price;
  String? image;
  String? name;

  CartModel(
      {this.id,
      this.user,
      this.itemSize,
      this.amount,
      this.order,
      this.size,
      this.price,
      this.image,
      this.name});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    itemSize = json['item_size'];
    amount = json['amount'];
    order = json['order'];
    size = json['size'];
    price = json['price']?.toDouble();
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id.toString();
    data['user'] = user.toString();
    data['item_size'] = itemSize.toString();
    data['amount'] = amount.toString();
    data['order'] = order.toString();
    data['size'] = size;
    data['price'] = price.toString();
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}