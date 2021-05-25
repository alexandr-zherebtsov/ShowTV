import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({
  String title = '',
  String message = '',
  int duration = 2600,
}) {
  Get.snackbar(
    title,
    message,
    margin: const EdgeInsets.all(10.0),
    messageText: const Offstage(),
    titleText: Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Text(
        title,
        style: Get.textTheme.headline2,
        overflow: TextOverflow.fade,
        softWrap: false,
      ),
    ),
    icon: Icon(Icons.warning_amber_sharp),
    shouldIconPulse: true,
    barBlur: 20,
    isDismissible: true,
    duration: Duration(milliseconds: duration),
  );
}
