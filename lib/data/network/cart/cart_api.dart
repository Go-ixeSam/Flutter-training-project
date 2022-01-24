import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:online_croceries/data/network/dio_client.dart';
import 'package:online_croceries/data/network/rest_client.dart';
import 'package:online_croceries/models/cart/cart_list.dart';

class CartApi {
  final DioClient _dioClient;

  final RestClient _restClient;

  CartApi(this._dioClient, this._restClient);

  Future<CartList> getCart() async {
    try {
      final res = await _dioClient.get(
        Endpoints.getCart,
        options: Options(headers: {
          "authorization": "Bearer ${Strings.token}",
        }),
      );
      print('get success');
      return CartList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
