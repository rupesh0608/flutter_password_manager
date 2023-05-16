import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

extension Utilityy on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (
    FocusScope.of(this).focusedChild!.context!.widget is! EditableText);
  }
}

extension Utility on String {
  toast() => Fluttertoast.showToast(
    msg: this,
    gravity:ToastGravity.CENTER,
    backgroundColor:const Color(0xff505050),
    toastLength: Toast.LENGTH_SHORT,
  );
}

extension ContextExntesion on BuildContext {
  hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
          (Map<K, List<E>> map, E element) =>
      map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension Feild on TextEditingController {
  String value() => text.toString();
}

extension TextFieldController on TextEditingController {
  getValue() => text.toString();
}

pop() {
  Get.back();
}

extension CustomWidget on Widget {

  onTap(Function onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap(),
        child: this,
      ),
    );
  }

  pressBack() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: this,
    );
  }

  navigate(
      {bool isAwait = false,
        bool isRemove = false,
        bool leftToRight = false,
        bool isInfinity = false}) async {
    if (isRemove) {
      return await Get.off(this, transition: Transition.rightToLeftWithFade);
    } else if (isAwait) {
      return await Get.to(()=> this, transition: Transition.rightToLeftWithFade);
    } else if (isInfinity) {
      return await Get.offAll(this, transition: Transition.rightToLeftWithFade);
    } else {
      return await Get.to(()=> this, transition: Transition.rightToLeftWithFade);
    }
  }
}

extension Integer on int {
  delayed(Function function) {
    Future.delayed(Duration(seconds: this), () {
      function();
    });
  }

  horizontalSpace() => SizedBox(width: toDouble());

  verticalSpace() => SizedBox(height: toDouble());

  toast(context) => Fluttertoast.showToast(
    msg: toString(),
    toastLength: Toast.LENGTH_SHORT,
  );

  loop(Function function) {
    for (var i = 0; i < this; i++) {
      function(i);
    }
  }

  paddingLeft() {
    return EdgeInsets.only(left: toDouble());
  }

  paddingTop() {
    return EdgeInsets.only(top: toDouble());
  }

  paddingAll() {
    return EdgeInsets.all(toDouble());
  }

  paddingRight() {
    return EdgeInsets.only(right: toDouble());
  }

  paddingVertical() {
    return EdgeInsets.only(top: toDouble(), bottom: toDouble());
  }

  paddingHorizontal() {
    return EdgeInsets.only(left: toDouble(), right: toDouble());
  }

  marginAll() {
    return EdgeInsets.all(toDouble());
  }

  marginLeft() {
    return EdgeInsets.only(left: toDouble());
  }

  marginTop() {
    return EdgeInsets.only(top: toDouble());
  }
  marginBottom() {
    return EdgeInsets.only(bottom: toDouble());
  }

  marginRight() {
    return EdgeInsets.only(right: toDouble());
  }

  marginVertical() {
    return EdgeInsets.only(top: toDouble(), bottom: toDouble());
  }

  marginHorizontal() {
    return EdgeInsets.only(left: toDouble(), right: toDouble());
  }

  paddingOnly({
    required double top,
    required double bottom,
  }) {
    return EdgeInsets.only(
        right: toDouble(), left: toDouble(), top: top, bottom: bottom);
  }

  marginOnly({
    required double top,
    required double bottom,
  }) {
    return EdgeInsets.only(
        right: toDouble(), left: toDouble(), top: top, bottom: bottom);
  }
}
extension DateHelper on DateTime {

  String formatDate() {
    const String dateFormatter = 'dd MMM y';
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }
  bool isSameDate(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
  String getTimeFromDateAndTime(String date) {
    print("timeee");
    print(date);
    DateTime dateTime;
    try {
      dateTime = DateTime.parse(date).toLocal();
      return DateFormat.jm().format(dateTime).toString(); //5:08 PM
// String formattedTime = DateFormat.Hms().format(now);
// String formattedTime = DateFormat.Hm().format(now);   // //17:08  force 24 hour time
    }
    catch (e) {
      return date;
    }
  }
}
