import 'package:dio/dio.dart';

String baseUrl = "http://www.cosmatics.growfet.com/";
Duration apiTimeOut = const Duration(seconds: 30);

class DioHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<CustomResponse> postData({
    required String endpoint,
    required dynamic data,
  }) async {
    // if (endpoint == "api/Auth/logout") {
    //   var token = CacheHelper.getToken();
    //   _dio.options.headers.addAll({"Authorization": "Bearer $token"});
    // }
    try {
      final response = await _dio.post<dynamic>(endpoint, data: data);
      if (response.data == null || response.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: response.data);
      }
      return CustomResponse(isSuccess: false, data: response.data);
    } on DioException catch (ex) {
      return CustomResponse(isSuccess: false, data: ex.response?.data);
    }
  }

  static Future<CustomResponse> putData({
    required String endpoint,
    required dynamic data,
  }) async {
    // var token = CacheHelper.getToken();
    // _dio.options.headers.addAll({"Authorization": "Bearer $token"});
    try {
      final response = await _dio.put<dynamic>(endpoint, data: data);
      if (response.data == null || response.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: response.data);
      }
      return CustomResponse(isSuccess: false, data: response.data);
    } on DioException catch (ex) {
      return CustomResponse(isSuccess: false, data: ex.response?.data);
    }
  }

  static Future<CustomResponse> getData(
    String endpoint, [
    dynamic queryParameters,
  ]) async {
    // if (endpoint == "api/Auth/profile") {
    //   var token = CacheHelper.getToken();
    //   _dio.options.headers.addAll({"Authorization": "Bearer $token"});
    // }
    try {
      final response = await _dio.get<dynamic>(
        endpoint,
        queryParameters: queryParameters,
      );
      if (response.data == null || response.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: response.data);
      }
      return CustomResponse(isSuccess: false, data: response.data);
    } on DioException catch (ex) {
      return CustomResponse(isSuccess: false, data: {ex.response?.data});
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  final dynamic data;
  late final String msg;
  CustomResponse({required this.isSuccess, required this.data}) {
    msg = data is Map ? data['message'] : null;
  }
}
