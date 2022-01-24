import 'dart:async';
import 'package:online_croceries/data/network/constants/endpoints.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/login/email_login_status_response.dart';
import '../dio_client.dart';
import '../rest_client.dart';

class LoginApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  LoginApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<EmailLoginStatusResponse> login(String username,String password) async {
    try {
      final res = await _dioClient.post(Endpoints.login,data: {
        "username":username,
        "password":password
      });
      print("Login API thành công rồi");
      return EmailLoginStatusResponse.fromJson(res);
    } catch (e) {
      print("Login API fail lòi\n ${e.toString()}");
      throw e;
    }
  }
}
