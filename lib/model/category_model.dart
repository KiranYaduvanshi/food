class CategoryModel {
  List<Items>? items;

  CategoryModel({this.items});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? name;
  String? image;
  String? description;
  String? address;
  String? percentage;
  List<String>? category;
  String? distance;
  List<Subcategory>? subcategory;
  CartInfo? cartInfo;

  Items(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.address,
      this.percentage,
      this.category,
      this.distance,
      this.subcategory,
      this.cartInfo});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    address = json['address'];
    percentage = json['percentage'];
    category = json['category'].cast<String>();
    distance = json['distance'];
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new Subcategory.fromJson(v));
      });
    }
    cartInfo = json['cartInfo'] != null
        ? new CartInfo.fromJson(json['cartInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['address'] = address;
    data['percentage'] = percentage;
    data['category'] = category;
    data['distance'] = distance;
    if (subcategory != null) {
      data['subcategory'] = subcategory!.map((v) => v.toJson()).toList();
    }
    if (cartInfo != null) {
      data['cartInfo'] = cartInfo!.toJson();
    }
    return data;
  }
}

class Subcategory {
  int? id;
  int? pid;
  String? name;
  String? hotelName;
  String? image;
  String? description;
  String? cat;
  String? price;

  Subcategory(
      {this.id,
      this.pid,
      this.name,
      this.hotelName,
      this.image,
      this.description,
      this.cat,
      this.price});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pid = json['pid'];
    name = json['name'];
    hotelName = json['hotelName'];
    image = json['image'];
    description = json['description'];
    cat = json['cat'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pid'] = this.pid;
    data['name'] = this.name;
    data['hotelName'] = this.hotelName;
    data['image'] = this.image;
    data['description'] = this.description;
    data['cat'] = this.cat;
    data['price'] = this.price;
    return data;
  }
}

class CartInfo {
  List<Products>? products;

  CartInfo({this.products});

  CartInfo.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? pid;
  int? qty;

  Products({this.pid, this.qty});

  Products.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['qty'] = this.qty;
    return data;
  }
}
