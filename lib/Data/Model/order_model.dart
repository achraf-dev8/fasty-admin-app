
class OrderModel {
  int? id;
  int? user;
  String? address;
  double? deliveryPrice;
  String? deliveryTime;
  double? price;
  String? payementMethod;
  int? state;
  String? date;
  int? delivery;
  String? deliveryName;
  String? disapprovementMsg;

  OrderModel(
      {this.id,
      this.user,
      this.address,
      this.deliveryPrice,
      this.deliveryTime,
      this.price,
      this.payementMethod,
      this.state,
      this.date , this.delivery, this.deliveryName, this.disapprovementMsg});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    address = json['address'];
    deliveryPrice = json['delivery_price'].toDouble();
    deliveryTime = json['delivery_time'];
    price = json['price'].toDouble();
    payementMethod = json['payement_method'];
    state = json['state'];
    delivery = json['delivery'];
    deliveryName = json['delivery_name'];
    date = json['date'];
    disapprovementMsg = json['disapprove_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id?.toString();
    data['user'] = user?.toString();
    data['address'] = address?.toString();
    data['delivery_price'] = deliveryPrice?.toString();
    data['delivery_time'] = deliveryTime;
    data['price'] = price?.toString();
    data['payement_method'] = payementMethod;
    data['state'] = state?.toString();
    data['date'] = date;
    data['delivery'] = delivery;
    data['delivery_name'] = deliveryName;
    data['disapprove_msg'] = disapprovementMsg;
    return data;
  }
}
