import 'package:dio/dio.dart';
import '../../utils/constants/api_path.dart';
import '../models/schedule_model.dart';
import '../core/network/network_client.dart';

class ScheduleRepo {
  Dio dio = NetworkClient().dio;

  //lịch học
  Future<List<ScheduleModel>> getScheduleList(
      String dayStart, String dayEnd) async {
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
