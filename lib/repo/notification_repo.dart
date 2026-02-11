import 'package:casalink/models/notification_model.dart';
import 'package:casalink/utils/constants/api_path.dart';
import 'package:dio/dio.dart';
import '../core/network/network_client.dart';

class NotiRepo {
  Dio dio = NetworkClient().dio;
  Future<List<NotificationModel>> getNotifications() async {
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
