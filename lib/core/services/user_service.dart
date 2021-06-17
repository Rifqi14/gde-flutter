import 'package:dio/dio.dart';
import 'package:whatsapp/core/models/user_model.dart';
import 'package:whatsapp/core/services/http_connection.dart';
class UserService extends HttpConnection {
  Future login(
    String username,
    String password,
  ) async {
    FormData _data = FormData.fromMap({
      "username": username,
      "password": password,
    });

    return await post('/auth/login', data: _data, needsToken: false, pure: true);
  }
  Future me() async {
    Response res = await post('/auth/me', pure: true, bypassError: true);
    if (res.statusCode == 200) {
      return UserModel.fromJson(res.data);
    }
  }
}
