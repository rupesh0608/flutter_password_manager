import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/utils/util_extensions.dart';
import 'package:password_manager/view/login_screen.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../utils/utility.dart';
import '../../constant/api_end_point.dart';
import 'api_response.dart';

class ApiHitter {
  static Dio? _dio;

  Dio getDio({String baseurl = ''}) {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
          baseUrl: baseurl.isEmpty ? ApiEndpoint.base_url : baseurl, connectTimeout: 30000, receiveTimeout: 30000);
      return Dio(options)
        ..interceptors.add(LogInterceptor())
        ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          compact: false,
        ))
        ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
          return handler.next(options); //continue
        }, onResponse: (response, handler) async {
          debugPrint("response::::" + response.toString());
          if (response.data["code"] == 401) {
            clearData();
            const LoginScreen().navigate(isInfinity: true);
          }
          return handler.next(response); // continue
        }, onError: (DioError e, handler) async {
          debugPrint("error response::::" + e.response.toString());
          debugPrint("error message::::" + e.message.toString());

          return handler.next(e);
        }));
    } else {
      return _dio!;
    }
  }

  Future<ApiResponse> getPostApiResponse(
    String endPoint, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    String baseurl = '',
    String contentType = 'application/json',
  }) async {
    bool value = await checkInternetConnection();
    if (value) {
      try {
        var response = await getDio(
          baseurl: baseurl,
        ).post(endPoint,
            options: Options(
              headers: headers,
              contentType: contentType,
            ),
            data: data);
        return ApiResponse(response.statusCode == 200, response: response, msg: response.statusMessage!);
      } catch (error) {
        return exception(
          error,
        );
      }
    } else {
      return ApiResponse(false, msg: "Check your internet connection and Please try again later.");
    }
  }

  Future<ApiResponse> getPutApiResponse(
    String endPoint,
    BuildContext context, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    String baseurl = '',
  }) async {
    bool value = await checkInternetConnection();
    if (value) {
      try {
        var response = await getDio(
          baseurl: baseurl,
        ).put(endPoint,
            options: Options(
              headers: headers,
              contentType: "application/json",
            ),
            data: data);
        return ApiResponse(response.statusCode == 200, response: response, msg: response.statusMessage!);
      } catch (error) {
        return exception(
          error,
        );
      }
    } else {
      return ApiResponse(
        false,
        msg: "Check your internet connection and Please try again later.",
      );
    }
  }

  Future<ApiResponse> getApiResponse(
    String endPoint, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    String baseurl = '',
  }) async {
    bool value = await checkInternetConnection();
    if (value) {
      try {
        var response = await getDio(
          baseurl: baseurl,
        ).get(
          endPoint,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
            contentType: "application/json",
          ),
        );
        return ApiResponse(response.statusCode == 200, response: response, msg: response.statusMessage!);
      } catch (error) {
        return exception(
          error,
        );
      }
    } else {
      debugPrint("not connected ");
      return ApiResponse(false, msg: "Check your internet connection and Please try again later.", response: null);
    }
  }

  deleteApiResponse(
    String endPoint,
    BuildContext context, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    String baseurl = '',
  }) async {
    bool value = await checkInternetConnection();
    if (value) {
      try {
        var response = await getDio(
          baseurl: baseurl,
        ).delete(
          endPoint,
          options: Options(
            headers: headers,
            contentType: "application/json",
          ),
        );
        return ApiResponse(response.statusCode == 200, response: response, msg: response.statusMessage!);
      } catch (error) {
        return exception(
          error,
        );
      }
    } else {
      return ApiResponse(false, msg: "Check your internet connection and Please try again later.");
    }
  }

  Future<ApiResponse> getFormApiResponse(String endPoint,
      {FormData? data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await getDio().post(endPoint,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ));
      return ApiResponse(response.statusCode == 200, response: response, msg: response.statusMessage!);
    } catch (error) {
      return exception(
        error,
      );
    }
  }

  exception(
    error,
  ) {
    try {
      return ApiResponse(
        false,
        msg: "${error?.response?.data['message'] ?? "Sorry Something went wrong."}",
      );
    } catch (e) {
      if (DioErrorType.other == error.type ||
          DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        if (error.message.contains('SocketException')) {
          return ApiResponse(false, msg: "Check your internet connection and Please try again later.");
        } else if (error.message.contains("Connecting timed out [30000ms]")) {
          return ApiResponse(
            false,
            msg: "Please check your internet connection",
          );
        } else {
          return ApiResponse(
            false,
            msg: "Sorry Something went wrong.",
          );
        }
      } else {
        return ApiResponse(false, msg: "Sorry Something went wrong.");
      }
    }
  }
}
