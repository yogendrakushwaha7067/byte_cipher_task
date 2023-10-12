import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../Models/profile_model.dart';
import '../Utils/const_value.dart';
import '../View/Home/home_screen.dart';

class UserProfileController extends GetxController {
  var profilemodel = ProfileModel();
  userprofile(BuildContext context, String id) async {
    final prefs = await SharedPreferences.getInstance();
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    _dialog.show(
      message: 'Loading...',
    );
    var url = Uri.parse(ConstString.userprofile + "${id}");
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.getString("userToken")}"
    });
    var data = jsonDecode(response.body.toString());
    print(response.body);
    if (response.statusCode == 200) {
      profilemodel = ProfileModel.fromJson(data);
      update();
      _dialog.hide();
    } else {
      _dialog.hide();

      ConstSnackbar.getsnackbar("Erorr", "Something went wrong");
    }
  }
}
