import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/schedule_model.dart';
import '../utils/constants/api_path.dart';

class ExcerciseRepo {
  Dio dio = Dio();
  Future<List<HomeWorkModel>> getExcercises() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.listExercise,
    );
    List<HomeWorkModel> result = ((response.data)['data'] as List)
        .map((e) => HomeWorkModel.fromJson(e))
        .toList();
    return result;
  }
}
