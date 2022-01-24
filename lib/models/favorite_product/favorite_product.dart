import 'package:online_croceries/models/product/product.dart';

class FavoriteProduct {
  String? title;
  int? id;
  List<Product>? product;

  FavoriteProduct({this.title, this.id, this.product});

  FavoriteProduct.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
