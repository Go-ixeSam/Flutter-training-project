import 'dart:async';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:online_croceries/models/dashboard/dashboard.dart';
import '../dio_client.dart';
import '../rest_client.dart';

class DashboardApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  DashboardApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  // Future<List> getDashBoardBanner() async {
  //   try {
  //     final res = await _dioClient.get(Endpoints.getDashBoardBanner);
  //     return res[0];
  //   } catch (e) {
  //     print(e.toString());
  //     throw e;
  //   }
  // }
  //  Future<CategoryList> getCategoies() async {
  //   try {
  //     final res = await _dioClient.get(Endpoints.getDashBoardBanner);
  //     return CategoryList.fromJson(res);
  //   } catch (e) {
  //     print(e.toString());
  //     throw e;
  //   }
  // }
  Future<List<String>?> getDashBoardBanner() async {
    try {
      final res = await _dioClient.get(Endpoints.getDashBoardBanner,
          options: Options(headers: {
            "authorization": "Bearer ${Strings.token}",
          }));
      return res.cast<String>();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
