import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repo/login_repo.dart';
import '../../utils/constants/api_path.dart';

class NetworkClient {
  static final NetworkClient _instance = NetworkClient._internal();
  factory NetworkClient() => _instance;

  late Dio dio;

  NetworkClient._internal() {
    dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final String? token = prefs.getString('token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // Attempt to refresh token
            final String newToken = await LoginRepo().refreshToken();
            if (newToken != '') {
              // Update headers and retry request
              e.requestOptions.headers['Authorization'] = 'Bearer $newToken';
              final opts = Options(
                method: e.requestOptions.method,
                headers: e.requestOptions.headers,
              );
              final response = await dio.request(
                e.requestOptions.path,
                options: opts,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters,
              );
              return handler.resolve(response);
            }
          }
          return handler.next(e);
        },
      ),
    );
    
    // Add logging if needed
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
