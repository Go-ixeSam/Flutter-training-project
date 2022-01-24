import 'dart:async';
import 'package:dio/dio.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:online_croceries/models/shop/shop_list.dart';
import 'package:online_croceries/models/testing/jsonplaceholder.dart';
import '../dio_client.dart';
import '../rest_client.dart';

class ShopApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  ShopApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<ShopList> getShop() async {
    try {
      final res = await _dioClient.get(Endpoints.getShop,
          options: Options(headers: {
            "authorization": "Bearer ${Strings.token}",
          }));
      return ShopList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
