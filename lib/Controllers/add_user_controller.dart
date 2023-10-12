import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../Utils/const_value.dart';
import '../View/Home/home_screen.dart';

class AddUserControlller extends GetxController {
  useradd(
      BuildContext context, String email, String name, String location) async {
    final prefs = await SharedPreferences.getInstance();
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    _dialog.show(
      message: 'Loading...',
    );
    var url = Uri.parse(ConstString.createuser);
    var response = await http.post(url,
        body: jsonEncode({"name": name, "email": email, "location": location}),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${prefs.getString("userToken")}"
        });
    var data = jsonDecode(response.body.toString());
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      ConstSnackbar.getsnackbar("Sucess", "User Add Sucessfuliy");
      _dialog.hide();
      Get.to(() => HomeScreen());
    } else {
      _dialog.hide();

      ConstSnackbar.getsnackbar("Erorr", "Something went wrong");
    }
  }
}
