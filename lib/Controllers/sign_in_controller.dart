import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../Utils/const_value.dart';
import '../View/Home/home_screen.dart';

class SignInController extends GetxController {
  login(BuildContext context, String email, String passward) async {
    final prefs = await SharedPreferences.getInstance();
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    _dialog.show(
      message: 'Loading...',
    );
    var url = Uri.parse(ConstString.baseurl + ConstString.login);
    var response = await http.post(url,
        body: jsonEncode({"email": email, "password": passward}),
        headers: {"Content-Type": "application/json"});
    var data = jsonDecode(response.body.toString());
    print(response.body);
    if (response.statusCode == 200) {
      if (data["code"].toString() == "1") {
        ConstSnackbar.getsnackbar("Erorr", data["message"].toString());
        _dialog.hide();
      } else {
        prefs.setString("userToken", "${data["data"]["Token"]}");
        ConstSnackbar.getsnackbar("Sucess", data["message"].toString());
        _dialog.hide();
        Get.to(() => HomeScreen());
      }
    } else {
      _dialog.hide();

      ConstSnackbar.getsnackbar("Erorr", "Something went wrong");
    }
  }
}
