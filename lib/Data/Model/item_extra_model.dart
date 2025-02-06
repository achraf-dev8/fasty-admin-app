class ItemExtraModel {
  int? id;
  int? item;
  int? extra;

  ItemExtraModel(
      {this.id, this.item,
      this.extra});

  ItemExtraModel.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    item  = json['item'];
    extra  = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['item'] = item.toString();
    data['extra'] = extra.toString();
    
    return data;
  }
}