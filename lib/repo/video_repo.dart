import 'package:dio/dio.dart';
import '../../utils/constants/api_path.dart';
import '../models/info_class_model.dart';
import '../core/network/network_client.dart';

class VideoRepository {
  Dio dio = NetworkClient().dio;
  Future<List<InfoClassModel>> getListClass() async {
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

  Future<List<LessonVideoModel>> getlistLessonVideo({
    required String topicalId,
    required String settingCoureTypeId,
  }) async {
    final response = await dio.post(
      ApiPath.listLecture,
      data: {
        'topical_id': topicalId,
        'setting_course_type_id': settingCoureTypeId,
      },
    );
    List<LessonVideoModel> result = ((response.data)['data']['lessons'] as List)
        .map((e) => LessonVideoModel.fromJson(e))
        .toList();
    return result;
  }

  Future<String> getLinkVideo({
    required String lessonId,
    required String settingCoureTypeId,
    required String lessonType,
  }) async {
    final response = await dio.post(
      ApiPath.detailLesson,
      data: {
        'lesson_id': lessonId,
        'setting_course_type_id': settingCoureTypeId,
        'lesson_type': lessonType,
      },
    );
    return response.data['data']['lesson_content'];
  }
}
