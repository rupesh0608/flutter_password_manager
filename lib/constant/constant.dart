import 'dart:ui';

class ImageConstant {
  static const String imageSplashBGImage = "assets/image/splash_image.png";
}

class IconConstant{
  static const String icLock="assets/image/icons/ic_lock.png";
  static const String icGoogle="assets/image/icons/logo_google.png";
  static const String icFb="assets/image/icons/logo_fb.png";
  static const String icLinkedin="assets/image/icons/logo_linkedin.png";
  static const String icMail="assets/image/icons/ic_mail.png";
  static const String icHome="assets/icon/ic_home.png";
  static const String icPassword="assets/icon/ic_password.png";
  static const String icProfile="assets/icon/ic_profile.png";
}
class FontsFamily {
  static const String gilroyNormal = "Gilroy-normal";
}

class ColorConstant {
 static Color hexToColor(String hex) {
    assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
        'hex color must be #rrggbb or #rrggbbaa');

    return Color(
      int.parse(hex.substring(1), radix: 16) +
          (hex.length == 7 ? 0xff000000 : 0x00000000),
    );
  }

  static Color colorBgFFFFFF = hexToColor('#FFFFFF');
  static Color colorBg9046CF = hexToColor('#9046CF');
  static Color color667085 = hexToColor('#667085');
  static Color color747980 = hexToColor('#747980');
  static Color color312E49 = hexToColor('#312E49');
  static Color color2805FF = hexToColor('#2805FF');
  static Color colorB4AAF2 = hexToColor('#B4AAF2');
  static Color colorCDCED1 = hexToColor('#CDCED1');
  static Color colorEBE9F1 = hexToColor('#EBE9F1');
}
