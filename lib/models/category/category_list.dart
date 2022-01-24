

import 'category.dart';

class CategoryList {
  final List<Category>? categories;

  CategoryList({
    this.categories,
  });
  
  factory CategoryList.fromJson(List<dynamic> json) {
    List<Category> categories = <Category>[];
    categories = json.map((category) => Category.fromJson(category)).toList();

    return CategoryList(
      categories: categories,
    );
  }
}
