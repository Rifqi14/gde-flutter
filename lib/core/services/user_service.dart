import 'package:dio/dio.dart';
import 'package:whatsapp/core/models/user_model.dart';
import 'package:whatsapp/core/services/http_connection.dart';
class UserService extends HttpConnection {
  Future login(
    String email,
    String password,
  ) async {
    FormData _data = FormData.fromMap({
      "email": email,
      "password": password,
    });

    return await post('/auth', data: _data, needsToken: false, pure: true);
  }
  Future me() async {
    Response res = await post('/me', pure: true, bypassError: true);
    print(res);
    if (res.statusCode == 200) {
      return UserModel.fromJson(res.data);
    }
  }
}
