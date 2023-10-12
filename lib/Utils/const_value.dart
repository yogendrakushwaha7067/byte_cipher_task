import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';

class ConstColor {
  static Color linear1 = Color(0xff9B69D4);
  static Color linear2 = Color(0xffC685B0);
  static Color buttontextcolor = Color(0xff8069D4);
  static Color textfieldcolor = Color(0xffF6F9FF);
}

class ConstString {
  static String baseurl = "http://restapi.adequateshop.com/api/authaccount/";
  static String login = "login";
  static String signup = "registration";
  static String user = "http://restapi.adequateshop.com/api/users?page=";
  static String userprofile = "http://restapi.adequateshop.com/api/users/";
  static String image = "https://jsonplaceholder.typicode.com/photos";
  static String createuser = "http://restapi.adequateshop.com/api/users";
}

class ConstSnackbar {
  static SnackbarController getsnackbar(String title, String subtitle) {
    SnackbarController snackbarController = Get.snackbar(
      '${title}',
      '${subtitle}',
      snackPosition: SnackPosition.BOTTOM,
      // forwardAnimationCurve: Curves.bounceInOut,
      // reverseAnimationCurve: Curves.easeOut,
      borderRadius: 8,
      colorText: Colors.white,
      backgroundColor: Colors.black,
    );
    return snackbarController;
  }
}
