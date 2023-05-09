import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


setStatusBarColor(Color statusBarColor) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor
  ));
}
hideStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom
  ]);
}
getScreenHeight(BuildContext context) {
 return MediaQuery
      .of(context)
      .size
      .height;
}
getScreenWidth(BuildContext context) {
  return MediaQuery
      .of(context)
      .size
      .width;
}
