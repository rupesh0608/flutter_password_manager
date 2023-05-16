import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../data/model/login_model.dart';
import '../data/model/register_model.dart';
import '../data/services/repository/auth_repo.dart';
import '../utils/utility.dart';

class AuthController extends GetxController {
  AuthRepo authRepo = AuthRepo();
  Rx<LoginModel> loginModel = LoginModel().obs;

  addLoginData(LoginModel login) {
    loginModel.value = login;
  }

  Future<RegisterModel> register(String firstName, String lastName,String email, String password, String confirmPassword) async{
    return await authRepo.register( firstName, lastName, email, password,confirmPassword);
  }
  Future<LoginModel> login(String email,String password)async{
    return await authRepo.login(email,password);
  }
}
