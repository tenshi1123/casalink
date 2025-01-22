import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/api_path.dart';
import '../models/schedule_model.dart';

class ScheduleRepo {
  Dio dio = Dio();
  Future<String> changePassword(
      String oldPass, String password, String newPass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    Response response2;
    response = await dio.get(
      ApiPath.checkPassword,
      queryParameters: {
        'password': oldPass,
      },
    );
    if (response.data['message'] == "Mật khẩu đúng") {
      response2 = await dio.post(ApiPath.changePassword, data: {
        'password': password,
        're_password': newPass,
      });
      return response2.data['message'];
    } else {
      return response.data['message'];
    }
  }

  //lịch học
  Future<List<ScheduleModel>> getScheduleList(
      String dayStart, String dayEnd) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.listSchedule,
      queryParameters: {
        'day_start': dayStart,
        'day_end': dayEnd,
      },
    );
    List<ScheduleModel> result = ((response.data)['data'] as List)
        .map((e) => ScheduleModel.fromJson(e))
        .toList();
    return result;
  }

  //chi tiet lich hoc
  Future<DetaiLessonModel> getDetailSchedule({
    required String? checkinOffId,
    required String typeLearn,
    required String? meetingId,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.detailSchedule,
      queryParameters: {
        'checkin_off_id': checkinOffId,
        'type_learn': typeLearn,
        'meeting_id': meetingId,
      },
    );
    DetaiLessonModel result =
        DetaiLessonModel.fromJson((response.data)['data']);
    return result;
  }
}
