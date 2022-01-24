


import 'package:online_croceries/models/product/product.dart';

class ProductList {
  final List<Product>? product;

  ProductList({
    this.product,
  });

  factory ProductList.fromJson(List<dynamic> json) {
    List<Product> products = <Product>[];
    products = json.map((product) => Product.fromJson(product)).toList();

    return ProductList(
      product: products,
    );
  }
}
