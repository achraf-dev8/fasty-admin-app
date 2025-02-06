class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? creationDate;
  String? password;
  int? address;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.creationDate,
      this.password,
      this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    creationDate = json['creation_date'];
    password = json['password'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id.toString();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['creation_date'] = creationDate;
    data['password'] = password;
    data['address'] = address.toString();
    return data;
  }
}
