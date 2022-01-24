import 'package:online_croceries/models/product_real/food_product.dart';


class FoodFavoriteList {
  List<FoodProduct>? foodProducts;

  FoodFavoriteList({
    this.foodProducts,

  });


  factory FoodFavoriteList.fromJson(List<dynamic> json) {
    List<FoodProduct> foodProducts= <FoodProduct>[];
    foodProducts = json.map((category) => FoodProduct.fromJson(category)).toList();

    return FoodFavoriteList(
      foodProducts: foodProducts,
    );
  }
}
