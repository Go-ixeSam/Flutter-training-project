import 'package:online_croceries/models/cart/cart.dart';

class CartList {
  final List<Cart>? carts;

  CartList({this.carts});

  factory CartList.fromJson(List<dynamic> json) {
    List<Cart> carts = <Cart>[];
    carts = json.map((cart) => Cart.fromJson(cart)).toList();
    return new CartList(
      carts: carts,
    );
  }
}
