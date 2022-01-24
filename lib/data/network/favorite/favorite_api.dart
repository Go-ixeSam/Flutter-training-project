import 'dart:async';
import 'package:dio/dio.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/favorite_product/favorite_product.dart';
import 'package:online_croceries/models/product_real/food_favorite_list.dart';
import '../dio_client.dart';
import '../rest_client.dart';

class FavoriteAPI {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  FavoriteAPI(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<FoodFavoriteList> getFavoriteProductList() async {
    try {
      final res = await _dioClient.get(Endpoints.getFavorite,
          options: Options(headers: {
            "authorization": "Bearer ${Strings.token}",
          }));
      return FoodFavoriteList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }


  /// Returns list of post in response
  Future<FoodFavoriteList> addCart(List<int>lisOfId) async {
    try {
      final res = await _dioClient.post(Endpoints.addCartFromFavorite,
          options: Options(headers: {
            "authorization": "Bearer ${Strings.token}",
          }),
      queryParameters: {
        "product_ids":lisOfId
      });
      return FoodFavoriteList.fromJson(res);
    } catch (e) {
      print("add cart API ${e.toString()}");
      throw e;
    }
  }
}
