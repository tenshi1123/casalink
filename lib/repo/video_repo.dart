import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/api_path.dart';
import '../models/info_class_model.dart';

class VideoRepository {
  Dio dio = Dio();
  Future<List<InfoClassModel>> getListClass() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.listLessonVideo,
    );
    List<InfoClassModel> result = ((response.data)['data'] as List)
        .map((e) => InfoClassModel.fromJson(e))
        .toList();
    return result;
  }

  Future<CourseVideoModel> getListTopical({
    required String typeId,
    required String scheduleId,
    required String courseId,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await dio.post(
      ApiPath.listTopical,
      data: {
        'course_id': courseId,
        'course_schedule_id': scheduleId,
        'setting_course_type_id': typeId,
      },
    );
    return CourseVideoModel.fromJson(response.data['data']);
  }
}
