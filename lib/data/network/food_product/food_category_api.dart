import 'dart:async';
import 'package:dio/dio.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/product_real/food_category.dart';
import 'package:online_croceries/models/product_real/food_category_list.dart';
import '../dio_client.dart';
import '../rest_client.dart';

class FoodCategoryAPI {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  FoodCategoryAPI(this._dioClient, this._restClient);


//Return a list of food category
  Future<FoodCategoryList> getListOfFoodCategory() async {
    try {
      final res = await _dioClient.get(Endpoints.explore,
      options: Options(
          headers: {
            "authorization": "Bearer ${Strings.token}",
          }
      )
      );
      return FoodCategoryList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
