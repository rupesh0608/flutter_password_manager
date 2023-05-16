import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../view/common/common_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      debugPrint('internet status connected');
      return true;
    }
  } on SocketException catch (_) {
    debugPrint('not connected');
    return false;
  }
}

bool checkValidEmail(String email) {
  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  return emailValid;
}

bool validatePasswordStructure(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

double screenWidth() {
  return Get.size.width;
}

double screenHeight() {
  return Get.size.height;
}

int getAppbarHeight() => (Get.statusBarHeight.toInt());

bool validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,15}$)';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

double getStatusBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}

String randomString(int length) {
  var alpha = "ARBAEROMCBHAKJJNKKWROJOAIIAHRAMNSNDFNWNNWNXBFBWFEWUEWBBEUWEWBFBWBZKAKKNAKNBWWARAHNAKNAN";
  var numeric = "1234567890987654321123451234567890678900987654321";

  Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 1; i < length + 1; i++) {
    if (i % 2 == 0) {
      result += alpha[rnd.nextInt(alpha.length)];
    } else {
      result += numeric[rnd.nextInt(numeric.length)];
    }
  }
  return result;
}

launchProgress({
  String message = 'Processing..',
}) {
  customDialog(
      isLoader: true,
      barrierDismissible: false,
      widget: const Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff077BDF)),
        //   backgroundColor: Color(0xffDBB77C),
      )));
}

disposeProgress() {
  Get.back();
}

Future<String> imgFromCamera() async {
  XFile? image = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50);
  return image!.path;
}

Future<String> imgFromGallery() async {
  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
  return image!.path;
}

void setData(String key, dynamic value) => GetStorage().write(key, value);

int? getInt(String key) => GetStorage().read(key);

String? getString(String key) => GetStorage().read(key);

bool? getBool(String key) => GetStorage().read(key);

double? getDouble(String key) => GetStorage().read(key);

getData(String key) {
  return GetStorage().read(key);
}

void clearData() async => GetStorage().erase();

String replaceAdd(String value) {
  if (value.contains("+")) {
    return value.replaceAll("+", "+");
  } else {
    return value;
  }
}

/*getLatLong(String query) async {
  List<Location> locations = await locationFromAddress(query);
  return locations;
}*/

cursorLength(int length) {
  return TextSelection.fromPosition(TextPosition(offset: length));
}

multipartFile(String path) async {
  if (path.contains("http")) {
    return path;
  } else {
    return await dio.MultipartFile.fromFile(
      path,
      filename: path.split("/").last,
    );
  }
}

String getNumber(String number, String code) {
  if (number.isNotEmpty && code.isNotEmpty) {
    return number.substring(code.length, number.length);
  } else {
    return "";
  }
}

changeToDouble(String value) {
  return double.parse(value);
}

extension PrettyJson on Map<String, dynamic> {
  String toPrettyString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this);
  }
}

