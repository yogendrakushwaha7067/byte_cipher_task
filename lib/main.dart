import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/Auth/Sign_up_Screen.dart';
import 'View/Auth/login_screen.dart';
import 'View/Home/home_screen.dart';
import 'View/profile/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: prefs,
  ));
}

class MyApp extends StatelessWidget {
  SharedPreferences sharedPreferences;
  MyApp({required this.sharedPreferences});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: sharedPreferences.getString("userToken") != null
          ? HomeScreen()
          : LoginScreen(),
    );
  }
}
