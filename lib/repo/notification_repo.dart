import 'package:casalink/models/notification_model.dart';
import 'package:casalink/utils/constants/api_path.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotiRepo {
  Dio dio = Dio();
  Future<List<NotificationModel>> getNotifications() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.listNotify,
    );
    List<NotificationModel> result = ((response.data)['data'] as List)
        .map((e) => NotificationModel.fromJson(e))
        .toList();
    return result;
  }
}
