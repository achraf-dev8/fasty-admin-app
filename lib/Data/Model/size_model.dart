class SizeModel {
  int? id;
  String? name;
 

  SizeModel(
      {this.id,
      this.name,});

  SizeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['name'] = name;
    return data;
  }
}