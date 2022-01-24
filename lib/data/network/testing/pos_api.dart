import 'dart:async';
import 'package:dio/dio.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/favorite_product/favorite_product.dart';
import 'package:online_croceries/models/product_real/food_favorite_list.dart';
import 'package:online_croceries/models/testing/jsonplaceholder.dart';
import '../dio_client.dart';
import '../rest_client.dart';

class PosAPI {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  PosAPI(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<Pos> getPosList() async {
    try {
      final res = await _dioClient.get(Endpoints.getTesting);
      return Pos.fromJson(res);
    } catch (e) {
      print("PosAPI"+e.toString());
      throw e;
    }
  }
}
