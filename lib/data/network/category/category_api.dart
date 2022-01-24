import 'dart:async';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:online_croceries/models/category/category_list.dart';
import '../dio_client.dart';
import '../rest_client.dart';

class CategoryApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  CategoryApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<CategoryList> getCategoies() async {
    try {
      final res = await _dioClient.get(Endpoints.getCategories);
      return CategoryList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
