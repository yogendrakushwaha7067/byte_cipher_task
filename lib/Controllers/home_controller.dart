import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../Models/home_model.dart';
import '../Utils/const_value.dart';
import '../View/Home/home_screen.dart';

class HomeScreenController extends GetxController {
  var homemodel = HomeModel();
  List<Data> list = [];
  int page = 1;
  bool isloading = true;
  updatepage() {
    page++;
    update();
  }

  updatebool(value) {
    isloading = value;
    update();
  }

  getData(
    BuildContext context,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    _dialog.show(
      message: 'Loading...',
    );
    var url = Uri.parse(ConstString.user + "${page}");
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.getString("userToken")}"
    });
    var data = jsonDecode(response.body.toString());
    print(response.body);
    if (response.statusCode == 200) {
      homemodel = HomeModel.fromJson(data);
      list.addAll(homemodel.data ?? []);
      update();
      _dialog.hide();
    } else {
      _dialog.hide();

      ConstSnackbar.getsnackbar("Erorr", "Something went wrong");
    }
  }

  paginate(
    BuildContext context,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    var url = Uri.parse(ConstString.user + "${page}");
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.getString("userToken")}"
    });
    var data = jsonDecode(response.body.toString());
    print(response.body);
    if (response.statusCode == 200) {
      homemodel = HomeModel.fromJson(data);
      list.addAll(homemodel.data ?? []);
      update();
    } else {
      ConstSnackbar.getsnackbar("Erorr", "Something went wrong");
    }
  }
}
