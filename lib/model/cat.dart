class Categories {
  List<Category>? category;

  Categories({this.category});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? name;
  String? cid;
  String? image;

  Category({this.name, this.cid, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cid = json['cid'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cid'] = this.cid;
    data['image'] = this.image;
    return data;
  }
}
