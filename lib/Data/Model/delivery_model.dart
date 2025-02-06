class DeliveryModel {
  int? id;
  String? name;
  String? phoneNumber;
  String? password;
  int? dropped;
  String? date;

  DeliveryModel(
      {this.id,
      this.name,
      this.phoneNumber,
      this.password,
      this.dropped,
      this.date});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    dropped = json['dropped'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['dropped'] = dropped.toString();
    data['date'] = date;
    return data;
  }
}
