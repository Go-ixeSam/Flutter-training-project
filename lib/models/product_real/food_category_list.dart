

import 'package:online_croceries/models/product_real/food_category.dart';

import 'package:online_croceries/models/product_real/food_category.dart';

import 'package:online_croceries/models/product_real/food_category.dart';

import 'package:online_croceries/models/product_real/food_category.dart';

class FoodCategoryList {
   List<FoodCategoy>? foodCategories;

  FoodCategoryList({
    this.foodCategories,

  });


  factory FoodCategoryList.fromJson(List<dynamic> json) {
    List<FoodCategoy> foodCategories= <FoodCategoy>[];
    foodCategories = json.map((category) => FoodCategoy.fromJson(category)).toList();

    return FoodCategoryList(
      foodCategories: foodCategories,
    );
  }
}
