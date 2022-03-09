import 'dart:async';
import 'package:dio/dio.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/favorite_product/favorite_product.dart';
import 'package:online_croceries/models/product_real/food_favorite_list.dart';
import 'package:online_croceries/models/testing/jsonplaceholder.dart';
import 'package:online_croceries/models/vincom/vincom_all_product.dart';
import '../dio_client.dart';
import '../rest_client.dart';

class VincomAPI {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  VincomAPI(this._dioClient, this._restClient);

  Future<Vincom> getVincom() async {
    try {
      final res = await _dioClient.get(Endpoints.getVincom);
      return Vincom.fromJson(res);
    } catch (e) {
      print("VincomAPI" + e.toString());
      throw e;
    }
  }
}
