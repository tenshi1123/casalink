import 'package:casalink/core/network/auth_interceptor.dart';
import 'package:casalink/utils/constants/api_path.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  )..interceptors.add(AuthInterceptor());
}
