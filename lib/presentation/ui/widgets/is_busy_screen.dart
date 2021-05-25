import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget isBusyScreen() {
  return Container(
    color: Get.theme.scaffoldBackgroundColor,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}