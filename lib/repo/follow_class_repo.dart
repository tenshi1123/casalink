import 'package:casalink/models/checkin_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/schedule_model.dart';
import '../utils/constants/api_path.dart';

class FollowClassRepo {
  Dio dio = Dio();
  Future<List<DataHomeWorkModel>> getExcercises() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
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

  Future<CheckinModel> getListCheckin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.listCheckin,
    );
    CheckinModel result =
        CheckinModel.fromJson((response.data)['data']['value']);
    return result;
  }
}
