import 'package:dio/dio.dart';

class ApiResponse {
  final bool status;
  final String msg;
  final Response ?response;

  ApiResponse(this.status, {this.msg = "Success", this.response});
}
