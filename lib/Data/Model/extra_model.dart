class ExtraModel {
  int? id;
  String? name;
 

  ExtraModel(
      {this.id,
      this.name,});

  ExtraModel.fromJson(Map<String, dynamic> json) {
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