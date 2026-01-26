import 'package:dio/dio.dart';

class AuthService {
  Future<String> refreshToken() async {
    final res = await Dio().post('/auth/refresh');
    return res.data['accessToken'];
  }
}
