class CartExtraModel {
  int? cart;
  int? extra;
  String? extraName;

  CartExtraModel({this.cart, this.extra, this.extraName});

  CartExtraModel.fromJson(Map<String, dynamic> json) {
    cart = json['cart'];
    extra = json['extra'];
    extraName  = json['extra_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['cart'] = cart.toString();
    data['extra'] = extra.toString();
    data['extra_name'] = extraName;
    return data;
  }
}