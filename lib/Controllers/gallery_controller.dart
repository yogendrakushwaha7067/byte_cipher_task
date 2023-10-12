import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../Models/gallery_model.dart';
import '../Models/profile_model.dart';
import '../Utils/const_value.dart';
import '../View/Home/home_screen.dart';

class GalleryController extends GetxController {
  var gallery = GalleryImageModel();
  int current = 0;
  updatecurrent(int index) {
    current = index;
    update();
  }

  List<GalleryImageModel> list = [];
  imageget(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    _dialog.show(
      message: 'Loading...',
    );
    var url = Uri.parse(ConstString.image);
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.getString("userToken")}"
    });
    var data = jsonDecode(response.body.toString());
    print(response.body);
    if (response.statusCode == 200) {
      for (var value in data) {
        gallery = GalleryImageModel.fromJson(value);
        list.add(gallery);
      }

      update();
      _dialog.hide();
    } else {
      _dialog.hide();

      ConstSnackbar.getsnackbar("Erorr", "Something went wrong");
    }
  }
}
