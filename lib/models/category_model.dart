class CategoryModel {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? display;

  CategoryModel({this.id, this.name, this.slug, this.parent, this.display});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['parent'] = parent;
    data['display'] = display;
    return data;
  }
}
