import 'package:casalink/models/checkin_model.dart';
import 'package:casalink/repo/login_repo.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/api_path.dart';
import '../models/info_model.dart';
import '../core/network/network_client.dart';

class InfoRepo {
  Dio dio = NetworkClient().dio;
  Future<InfoModel?> getInfo() async {
    Response response;
    try {
      response = await dio.get(
        ApiPath.user,
      );
      return InfoModel.fromJson(response.data['data']);
    } on DioException {
      // The interceptor already tries to refresh token and retry. 
      // If we are still here, it means even after retry it failed.
      return null;
    } catch (e) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
    }
    return null;
  }

  Future<InfoHomeModel> getInfoClass() async {
    Response response;
    response = await dio.get(
      ApiPath.infoclass,
    );
    return InfoHomeModel.fromJson(response.data['data']);
  }

  Future<List<DropClassModel>> getDropClass({required String type}) async {
    Response response;
    response = await dio.get(
      type == '1' ? ApiPath.classLearned : ApiPath.classLater,
    );
    List<DropClassModel> list = [];
    for (var item in response.data['data']) {
      list.add(DropClassModel.fromJson(item));
    }
    return list;
  }

  Future<List<DropLessonModel>> getDropLesson(
      DropClassModel model, String type) async {
    Response response;
    response = await dio.post(
      type == '1' ? ApiPath.lessonLearned : ApiPath.lessonLater,
      queryParameters: {
        'course_schedule_id': model.scheduleId,
        'setting_course_type_id': model.typeId,
      },
    );
    List<DropLessonModel> list = [];
    for (var item in response.data['data']) {
      list.add(DropLessonModel.fromJson(item));
    }
    return list;
  }

  Future requestLeave({
    required String reason,
    required String type,
    required String id,
    required String typeRequest,
  }) async {
    await dio.post(
      typeRequest == '1' ? ApiPath.requestLeave : ApiPath.requestLater,
      data: {
        'type': type,
        'buoi_hoc_id': id,
        'reason': reason,
      },
    );
  }

  Future<List<LeaveModel>> getLeaveList() async {
    Response response;
    response = await dio.post(ApiPath.leaveList);
    List<LeaveModel> list = [];
    for (var item in response.data['data']) {
      list.add(LeaveModel.fromJson(item));
    }
    return list;
  }

  Future deleteInfo() async {
    await dio.post(
      ApiPath.deleteUser,
    );
  }

  Future<String> changePassword(
      {required String oldPass,
      required String password,
      required String newPass}) async {
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

  Future<String> checkPassword(
      {required String oldPass,
      required String password,
      required String newPass}) async {
    Response response;
    response = await dio.get(
      ApiPath.checkPassword,
      queryParameters: {
        'password': oldPass,
      },
    );
    return response.data['message'];
  }

  Future forgotPassword(String phone, String pass, String rePass) async {
    await saveOtp(phone);
    await dio.post(ApiPath.forgotPassword, data: {
      'phone': phone,
      'password': pass,
      're_password': rePass,
    });
  }

  Future<bool> checkPhone(String phone) async {
    Response response = await dio.post(ApiPath.checkPhone, data: {
      'phone': phone,
    });
    return response.data['status'];
  }

  Future saveOtp(String phone) async {
    await dio.post(
      ApiPath.saveOtp,
      data: {'phone': phone, 'otp': '123456123456'},
    );
  }
}
