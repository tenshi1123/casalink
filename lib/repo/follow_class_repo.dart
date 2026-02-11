import 'package:casalink/models/checkin_model.dart';
import 'package:casalink/models/info_class_model.dart';
import 'package:dio/dio.dart';

import '../models/schedule_model.dart';
import '../utils/constants/api_path.dart';
import '../core/network/network_client.dart';

class FollowClassRepo {
  Dio dio = NetworkClient().dio;
  Future<List<DataHomeWorkModel>> getExcercises() async {
    Response response;
    response = await dio.get(
      ApiPath.listExercise,
    );
    List<DataHomeWorkModel> result = ((response.data)['data']['data'] as List)
        .map((e) => DataHomeWorkModel.fromJson(e))
        .toList();
    return result;
  }

  Future<ListFeedBackModel> getListFeedback() async {
    Response response;
    response = await dio.get(
      ApiPath.listFeedback,
    );
    ListFeedBackModel result =
        ListFeedBackModel.fromJson((response.data)['data']);
    return result;
  }

  Future<String> getDetailFeedback(
      String? checkinOffId, String typeLearn, String? meetingId) async {
    Response response;
    response = await dio.get(
      ApiPath.detailFeedback,
      queryParameters: {
        'checkin_off_id': checkinOffId,
        'type_learn': typeLearn,
        'meeting_id': meetingId,
      },
    );
    return (response.data)['data'];
  }

  //Danh sách điểm danh
  Future<CheckinModel> getListCheckin() async {
    Response response;
    response = await dio.get(
      ApiPath.listCheckin,
    );
    CheckinModel result =
        CheckinModel.fromJson((response.data)['data']['value']);
    return result;
  }

  //Chi tiết điểm danh
  Future<List<DetailCheckinModel>> getDetailCheckin({
    required String type,
    required String status,
    required String id,
  }) async {
    Response response;
    response = await dio.get(
      ApiPath.detailCheckin,
      queryParameters: {
        'type': type,
        'status': status,
        'customer_zoom_google_offline_id': id,
      },
    );
    List<DetailCheckinModel> result = ((response.data)['data'] as List)
        .map((e) => DetailCheckinModel.fromJson(e))
        .toList();
    return result;
  }

  Future<List<InfoClassModel>> getListClass() async {
    Response response;
    response = await dio.get(
      ApiPath.listClass,
    );
    List<InfoClassModel> result = ((response.data)['data'] as List)
        .map((e) => InfoClassModel.fromJson(e))
        .toList();
    return result;
  }

  Future<ClassDetailModel> getListLesson(
      {required String typeId, required String scheduleId}) async {
    final response = await dio.post(
      ApiPath.detailClass,
      data: {
        'setting_course_type_id': typeId,
        'course_schedule_id': scheduleId,
      },
    );
    return ClassDetailModel.fromJson(response.data['data']);
  }

  Future<List<RefeeModel>> getRefee({required String id}) async {
    Response response;
    response = await dio.get(
      ApiPath.refee,
      queryParameters: {
        'customer_course_schedule_id': id,
      },
    );
    List<RefeeModel> result = ((response.data)['data'] as List)
        .map((e) => RefeeModel.fromJson(e))
        .toList();
    return result;
  }
}
