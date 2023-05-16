// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:password_manager/utils/util_extensions.dart';


import 'package:shimmer/shimmer.dart';

import '../../utils/utility.dart';


Widget decoration(
    {double? height,
    double? width,
    Color? background,
    Color? borderColor,
    double radius = 10,
    double topLeft = 0,
    double topRight = 0,
    double bottomRight = 0,
    double bottomLeft = 0,
    bool allRadius = true,
    required Widget widget,
    int padding = 0,
    int margin = 0}) {
  return Container(
    width: width,
    height: height,
    padding: padding.paddingAll(),
    margin: margin.paddingAll(),
    decoration: BoxDecoration(
        color: background,
        border: borderColor == null ? null : Border.all(color: borderColor),
        borderRadius: allRadius
            ? BorderRadius.all(Radius.circular(radius))
            : BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomRight: Radius.circular(bottomRight),
                bottomLeft: Radius.circular(bottomLeft),
              )),
    child: widget,
  );
}

Widget editTextField(String title, TextEditingController controller, bool isPasVisible, String hint, bool _passwordVisible,
    {Function? onPressed,
    int? length,
    int maxLines = 1,
    bool enableNumber = false,
    Widget? suffixWidget,
    ValueChanged<String>? onFieldSubmitted,
    ValueChanged<String>? onChanged,
    bool enabled = true,
    bool read = false,
    double? width}) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 6, bottom: 6),
    decoration:
        BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xffDDDDDD)), borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff505050),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            Container(
              color: Colors.white,
              width: width ?? Get.size.width - 110,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: TextFormField(
                    enabled: enabled,
                    readOnly: read,
                    scrollPadding: 200.paddingAll(),
                    controller: controller,
                    inputFormatters: [LengthLimitingTextInputFormatter(length)],
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: isPasVisible ? !_passwordVisible : false,
                    keyboardType: enableNumber ? TextInputType.number : null,
                    maxLines: maxLines,
                    onChanged: (value) {
                      if (onChanged != null) onChanged(value);
                    },
                    onFieldSubmitted: (value) {
                      if (onFieldSubmitted != null) onFieldSubmitted(value);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "",
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                      hintStyle: TextStyle(
                          color: Color(0xff505050),
                          fontWeight: FontWeight.w500,
                          //fontFamily: StringFile.font_regular,
                          fontSize: 14),
                    ),
                    style: const TextStyle(color: Color(0xff505050), fontWeight: FontWeight.w500, fontSize: 18, height: 1
                        //  fontFamily: StringFile.font_medium
                        )),
              ),
            ),
          ],
        ),
        Visibility(
          visible: isPasVisible,
          child: GestureDetector(
            //  padding: 0.paddingAll(),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xff939292),
              ),
            ),
            onTap: () {
              onPressed!();
            },
          ),
        )
      ],
    ),
  );
}

Widget txtFieldWithoutBorder({
  required TextEditingController controller,
  required String hint,
  bool enabled = true,
  ValueChanged<String>? onFieldSubmitted,
  ValueChanged<String>? onChanged,
  int max = 1,
  TextStyle style = const TextStyle(
    color: Color(0xff003171),
    fontWeight: FontWeight.w500,
    fontSize: 18,
  ),
}) {
  return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      controller: controller,
      enabled: enabled,
      scrollPadding: const EdgeInsets.only(bottom: 50),
      //a
      textInputAction: TextInputAction.next,
      decoration: InputDecoration.collapsed(
        hintText: hint,
        hintStyle: TextStyle(color: Color(0xff003171), fontWeight: FontWeight.w500, fontSize: 16),
      ),
      maxLines: max,
      style: style);
}

headingText(String title, String heading) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
            // fontFamily: StringFile.font_semi_bold,
            fontWeight: FontWeight.w600,
            color: Color(0xffF1C36A),
            fontSize: 24),
      ),
      //5.verticalSpace(),
      Text(heading,
          style: const TextStyle(
              // fontFamily: StringFile.font_regular,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 16)),
    ],
  );
}

customDialog({
  bool barrierDismissible = true,
  var isLoader = false,
  Widget widget = const Text('Pass sub widgets'),
}) async {
  var result = await Get.dialog(
      isLoader
          ? widget
          : Align(
              alignment: Alignment.center,
              child: widget,
            ),
      barrierDismissible: barrierDismissible);
  if (result != null) return result;
}

Widget customButton(
    {String? text,
    dynamic onTap,
    Color iconBgColor = const Color(0xffF1C36A),
    Color backgroundColor = const Color(0xffF1C36A),
    Color borderColor = const Color(0xffF1C36A),
    Color textColor = Colors.black,
    bool showLeft = false,
    bool imageOnCenter = false,
    String image = "asset/image/head.svg"}) {
  return GestureDetector(
    // padding: 0.paddingAll(),
    // color: backgroundColor,
    // disabledColor: backgroundColor,
    // elevation: 0,
    child: Container(
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xffF1C36A),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: button(text!, textColor, showLeft: showLeft, image: image, iconBgColor: iconBgColor, showIcon: false, imageOnCenter: imageOnCenter),
    ),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(8.0),
    //   side: BorderSide(color: borderColor),
    // ),
    // splashColor: backgroundColor,
    onTap: onTap,
  );
}

button(String text, Color textColor,
    {double bottomRight = 8,
    bool showIcon = true,
    bool showLeft = false,
    bool imageOnCenter = false,
    String image = "asset/image/head.svg",
    Color iconBgColor = const Color(0xff0B6DC2)}) {
  return Stack(alignment: Alignment.center, children: <Widget>[
    /*Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 11.0),
        child: Text(
          text.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),*/
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
            visible: showLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(image),
            )),
        Visibility(
          visible: showLeft,
          child: 8.horizontalSpace(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imageOnCenter) SvgPicture.asset(image, color: Colors.black),
              if (imageOnCenter) SizedBox(width: 10),
              Text(
                text.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: showIcon,
          child: Align(
            alignment: Alignment.bottomRight,
            child: decoration(
              width: 80,
              allRadius: false,
              topLeft: 60,
              bottomLeft: 60,
              bottomRight: bottomRight,
              topRight: 8,
              background: iconBgColor,
              padding: 15,
              margin: 0,
              borderColor: const Color(0xff0B6DC2),
              widget: SvgPicture.asset(
                "asset/image/right.svg",
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),

    /*  Visibility(
      visible: showIcon,
      child: Align(
        alignment: Alignment.bottomRight,
        child: decoration(
          width: 80,
          allRadius: false,
          topLeft: 60,
          bottomLeft: 60,
          bottomRight: bottomRight,
          topRight: 8,
          background: iconBgColor,
          padding: 15,
          margin: 0,
          borderColor: const Color(0xff0B6DC2),
          widget: SvgPicture.asset(
            "asset/image/right.svg",
            // fit: BoxFit.cover,
          ),
        ),
      ),
    ),*/
  ]);
}

dontHaveAccount(String textOne, String textTwo, {required Function onTap}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Padding(
      padding: 10.paddingAll(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textOne,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          5.horizontalSpace(),
          Text(textTwo,
              style: const TextStyle(
                color: Color(0xffF1C36A),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ))
        ],
      ),
    ),
  );
}

customAppBar({bool? isTransparent}) {
  return AppBar(
    backgroundColor: isTransparent == null || !isTransparent ? Colors.white : Colors.transparent,
    elevation: 0,
    leading: InkWell(
        onTap: () {
          pop();
        },
        child: Icon(
          Icons.arrow_back_outlined,
          color: Colors.white,
        )),
  );
}

// Widget screenBackground() => Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(image: AssetImage(backgroundImageWithCircle), fit: BoxFit.fill),
//       ),
//     );

Widget customList(
  ScrollPhysics physics, {
  required Widget child(index),
  var list = const [],
  Axis axis = Axis.vertical,
  ScrollController? controller,
  EdgeInsetsGeometry? padding,
}) {
  return ListView.builder(
    padding: padding ?? EdgeInsets.all(0.0),
    physics: physics,
    scrollDirection: axis,
    shrinkWrap: true,
    controller: controller,
    itemBuilder: (context, index) => Container(child: child(index)),
    itemCount: list.length > 0 ? list.length : 25,
    //controller: listScrollController,
  );
}

Widget tripListWidget(BuildContext context, String description, String mainText, {required Function onTap}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Column(
      children: [
        Padding(
          padding: 15.paddingOnly(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("asset/image/location_map.svg"),
              10.horizontalSpace(),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mainText, style: TextStyle(color: Color(0xff104E5B), fontSize: 18, fontWeight: FontWeight.w500, height: 1)),
                    3.verticalSpace(),
                    Text(description, style: TextStyle(color: Color(0xff8B96B8), fontSize: 15, fontWeight: FontWeight.w400, height: 1)),
                  ],
                ),
              ),
            ],
          ),
        ),
        divider(context),
        5.verticalSpace(),
      ],
    ),
  );
}

Widget topBackgroundImage(bool value, {String image = "asset/image/home_top_background.png"}) {
  return Visibility(
    visible: value,
    child: image.contains("svg")
        ? SvgPicture.asset(
            image,
            width: screenWidth(),
            fit: BoxFit.fitWidth,
          )
        : Image.asset(
            image,
            width: screenWidth(),
            fit: BoxFit.fitWidth,
          ),
  );
}

Widget divider(BuildContext context, {Color color = const Color(0xffD6E2ED)}) {
  return Container(
    width: screenWidth(),
    height: 1,
    color: color,
  );
}

Widget headingWithCross({required String title, required Function onTap, String icon = "asset/image/cross.svg", bool enableInfo = false}) {
  return Row(
    children: [
      InkWell(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 15, top: 0, bottom: 0),
          child: SvgPicture.asset(
            icon,
            //   color: Colors.white,
          ),
        ),
      ),
      0.horizontalSpace(),
      Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
      Visibility(
          visible: enableInfo,
          child: Expanded(
            child: SizedBox(),
          )),
      Visibility(
          visible: enableInfo,
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset("asset/image/info.svg"),
          )),
    ],
  );
}

Widget enterSrcDesWidget(
    {ValueChanged<String>? onFieldSubmittedSource,
    ValueChanged<String>? onChangedSource,
    ValueChanged<String>? onFieldSubmittedDestination,
    ValueChanged<String>? onChangedDestination,
    required TextEditingController sourceController,
    required TextEditingController destinationController,
    required String hintSrc,
    required String hintDes,
    required BuildContext context,
    bool sourceEnabled = true,
    bool destEabled = true,
    bool border = false}) {
  return decorationWithBorder(
    allRadius: true,
    radius: 10,
    borderColor: border ? Color(0xff97ADB6) : Colors.white,
    background: Colors.white,
    margin: 5,
    pad: 13.paddingOnly(top: 5, bottom: 5),
    widget: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("asset/image/dot_src_loc.svg"),
        15.horizontalSpace(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              7.verticalSpace(),
              txtFieldWithoutBorder(
                  controller: sourceController, hint: hintSrc, enabled: sourceEnabled, onChanged: onChangedSource, onFieldSubmitted: onFieldSubmittedSource),
              7.verticalSpace(),
              divider(context),
              7.verticalSpace(),
              txtFieldWithoutBorder(
                  controller: destinationController,
                  hint: hintDes,
                  enabled: destEabled,
                  onChanged: onChangedDestination,
                  onFieldSubmitted: onFieldSubmittedDestination),
              7.verticalSpace(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget stackAppBar(
    {required String title,
    required Function onTap,
    String image = "asset/image/car_top_background.png",
    bool enableInfo = false,
    String icon = "asset/image/cross.svg"}) {
  return Stack(
    alignment: Alignment.centerLeft,
    children: [
      topBackgroundImage(true, image: image),
      Positioned(
        top: 45,
        left: 0,
        bottom: 0,
        right: 0,
        child: Align(
          alignment: Alignment.centerLeft,
          child: headingWithCross(
              title: title,
              onTap: () {
                onTap();
              },
              icon: icon,
              enableInfo: enableInfo),
        ),
      ),
    ],
  );
}
/*
Widget stackAppBar({required String title,required Function onTap,
  String image="asset/image/back_upper.svg",bool enableInfo=false,
  String icon="asset/image/cross.svg"}) {
  return Stack(
    alignment: Alignment.centerLeft,
    children: [
     topBackgroundImage(true,image:image),
      Positioned(
        top: 45,left: 0,bottom: 0,right: 0,
        child: Align(
          alignment: Alignment.centerLeft,
          child: headingWithCross(title:title,onTap:(){
            onTap();
          },
          icon:icon,enableInfo: enableInfo
          ),
        ),
      ),
    ],
  );
}
*/

Widget networkImage({required String text, double radius = 8.0, required double height, required double width}) {
  return SizedBox(
    height: height,
    width: width,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: !text.contains("http")
          ? Image.file(
              File(text),
              fit: BoxFit.cover,
            )
          : text.contains("http")
              ? Image.network(text)
              : CachedNetworkImage(
                  imageUrl: text,
                  width: width,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    height: height,
                    width: width,
                    child: Shimmer.fromColors(
                      baseColor: Colors.black12,
                      highlightColor: Colors.white,
                      child: const Card(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  //   backgroundColor: Color(0xffDBB77C),,
                  errorWidget: (context, url, error) => Container(
                    color: Colors.black12,
                    height: height,
                    width: width,
                    child: const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                  ),
                ),
    ),
  );
}

Widget networkCircularImage(
    {required String text,
    double radius = 8.0,
    double height = 230,
    double width = 230,
    double iconHeight = 28,
    Color borderColor = const Color(0xff077BDF),
    Color backgroundColor = Colors.white,
    int padding = 6,
    double borderWidth = 3}) {
  print("profile image");
  print(text);
  return Container(
    width: width,
    height: height,
    padding: padding.paddingAll(),
    decoration: BoxDecoration(
        color: backgroundColor, borderRadius: BorderRadius.all(Radius.circular(radius)), border: Border.all(width: borderWidth, color: borderColor)),
    // color: Colors.transparent,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: !text.contains("http")
          ? Image.file(
              File(text),
              fit: BoxFit.cover,
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return errorWidget(iconHeight);
              },
            )
          : text.contains("http")
              ? Image.network(
                  text,
                  fit: BoxFit.cover,
                )
              : CachedNetworkImage(
                  imageUrl: text, fit: BoxFit.cover,
                  placeholder: (context, url) => customProgressBar(),
                  //   backgroundColor: Color(0xffDBB77C),,
                  errorWidget: (context, url, error) => errorWidget(iconHeight),
                ),
    ),
  );
}

errorWidget(double iconHeight) {
  return Center(
    child: Icon(
      Icons.person_rounded,
      color: const Color(0xffDADADA),
      // Icons.person,
      //   color:borderColor,
      size: iconHeight,
    ),
  );
}

customProgressBar() {
  return Center(
      child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Color(0xff077BDF)),
    //   backgroundColor: Color(0xffDBB77C),
  ));
}

Widget editImage({
  required Function onTap,
  required String image,
  Color borderColor = Colors.white,
  Color backgroundColor = const Color(0xffF1C36A),
  int padding = 6,
  double iconHeight = 15,
}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Stack(children: [
      networkCircularImage(
          text: image,
          iconHeight: iconHeight,
          height: 100,
          width: 100,
          radius: 50,
          borderColor: borderColor,
          backgroundColor: backgroundColor,
          padding: padding),
      Positioned(
        bottom: 0,
        right: 0,
        child: SvgPicture.asset("asset/image/edit.svg"),
      ),
    ]),
  );
}

Widget decorationWithBorder(
    {double? height,
    double? width,
    Color background = const Color(0xff077BDF),
    Color? borderColor,
    double radius = 0,
    double topLeft = 0,
    double topRight = 0,
    double bottomRight = 0,
    double bottomLeft = 0,
    bool allRadius = true,
    required Widget widget,
    int padding = 0,
    EdgeInsetsGeometry? pad,
    EdgeInsetsGeometry? mar,
    int margin = 0}) {
  return Container(
    width: width,
    height: height,
    padding: pad ?? padding.paddingAll(),
    margin: mar ?? margin.paddingAll(),
    decoration: BoxDecoration(
        color: background,
        border: Border.all(color: borderColor!),
        borderRadius: allRadius
            ? BorderRadius.all(Radius.circular(radius))
            : BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomRight: Radius.circular(bottomRight),
                bottomLeft: Radius.circular(bottomLeft),
              )),
    child: widget,
  );
}




buildingImage() {
  return SizedBox(
      height: screenHeight(),
      width: screenWidth(),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "asset/image/building.png",
          fit: BoxFit.cover,
        ),
      ));
}

void showPicker(
  context, {
  required Function cameraFunction,
  required Function galleryFunction,
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'.tr),
                onTap: () {
                  galleryFunction();
                }),
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('Camera'.tr),
              onTap: () async {
                cameraFunction();
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget errorMessage(String msg) {
  return Text(msg, style: TextStyle(color: Color(0xff104E5B), fontSize: 20, fontWeight: FontWeight.w500, height: 1));
}

