import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/sign_in_controller.dart';
import '../../Utils/const_value.dart';
import '../../Widget/reuseable_button.dart';
import '../../Widget/reuseable_textfield.dart';
import 'Sign_up_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController passward = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  final signcontroller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    ConstColor.linear1,
                    ConstColor.linear2,
                  ],
                  stops: [
                    0.0,
                    1.0
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SvgPicture.asset(
                        //   "assets/images/logo.svg",
                        //   fit: BoxFit.cover,
                        //   width: 200,
                        //   height: 200,
                        // ),
                        Image.asset(
                          "assets/images/logo1.png",
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "With your phone number",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          ReuseableTextField(
                            hint: "Email-id",
                            textEditingController: email,
                            validator: "Enter a valid email",
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          ReuseableTextField(
                            hint: "Password",
                            textEditingController: passward,
                            validator: "Enter a valid passward",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ReuseableButton(
                      text: "Login",
                      onclick: () {
                        final isValid = _formKey.currentState?.validate();

                        if (isValid == true) {
                          signcontroller.login(
                              context, email.text, passward.text);
                        }
                      },
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have not any account?",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ]),
            ),
          )),
    );
  }
}
