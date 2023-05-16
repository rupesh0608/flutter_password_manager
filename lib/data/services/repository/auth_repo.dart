import 'package:get/get.dart';
import 'package:password_manager/data/constant/api_end_point.dart';
import 'package:password_manager/data/services/network/api_hitter.dart';

import '../../model/login_model.dart';
import '../../model/register_model.dart';
import '../network/api_response.dart';

class AuthRepo {
  Future<LoginModel> login(String email, String password) async {
    ApiResponse apiResponse = await ApiHitter().getPostApiResponse(
        ApiEndpoint.login,
        data: {"email": email, "password": password});
    return LoginModel.fromJson(apiResponse.response!.data);
  }

  Future<RegisterModel> register(String firstName, String lastName,
      String email, String password, String confirmPassword) async {
    ApiResponse apiResponse =
        await ApiHitter().getPostApiResponse(ApiEndpoint.register, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    });
    return RegisterModel.fromJson(apiResponse.response?.data);
  }
}
