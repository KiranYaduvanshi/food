import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Product {
  String name;
  RxInt count = 0.obs;
  Product({
    required this.name,
  });
}

class ProductList {
  List<Product> list = [];

  int cart = 0;

  List<Product> createList() {
    list.add(Product(name: "name1"));
    list.add(Product(name: "name2"));
    list.add(Product(name: "name3"));
    list.add(Product(name: "name4"));
    return list;
  }

  int cartStatus(List<Product> list) {
    for (var item in list) {
      cart += item.count.value;
    }
    return cart;
  }
}
