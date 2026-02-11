import 'package:dio/dio.dart';
import '../utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/network/network_client.dart';

class LoginRepo {
  Dio dio = NetworkClient().dio;

  Future<bool> login(String phone, String password) async {
    Response response;
    var formData = FormData.fromMap({
      'phone': phone,
      'password': password,
    });
    try {
      response = await dio.post(
        ApiPath.login,
        data: formData,
      );
    } on DioException {
      return false;
    }
    if (response.data['status'] == false) {
      return false;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', response.data['data']["refresh_token"]);
    return response.data['data']["refresh_token"] != null;
  }

  Future<String> refreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    // Manual header setting removed, interceptor handles base case but refreshToken might need specific handling if it itself fails or needs old token
    // Actually, keep it simple for now as the interceptor adds token to all requests.
    Response response;
    try {
      response = await dio.get(ApiPath.refreshToken);
    } on DioException {
      await prefs.remove('token');
      return '';
    } catch (e) {
      await prefs.remove('token');
      return '';
    }
    await prefs.setString('token', response.data['data']["refresh_token"]);
    return response.data['data']["refresh_token"];
  }

  Future<String> getToken() async {
    final response = await Dio()
        .get('https://61df53d20f3bdb0017934a35.mockapi.io/se06/swaper');
    String mocktoken = response.data[0]['token'].toString();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', mocktoken);
    return mocktoken;
  }

  Future pushOnesignalId(String id) async {
    var formData = FormData.fromMap({
      'onesignal_id': id,
    });

    try {
      await dio.post(ApiPath.pushOnsignalId, data: formData);
    } on DioException {
      return false;
    }
  }

  Future deleteOnesignalId(String id) async {
    var formData = FormData.fromMap({
      'onesignal_id': id,
    });

    try {
      await dio.post(ApiPath.deleteOnsignalId, data: formData);
    } on DioException {
      return false;
    }
  }

  Future<List<String>> getListBanner() async {
    Response response;
    response = await dio.get(ApiPath.getBanner);
    List<String> result = ((response.data)['data'] as List)
        .map((e) => e['img_desktop'].toString())
        .toList();
    return result;
  }
}
