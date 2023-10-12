import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/sign_up_controller.dart';
import '../../Utils/const_value.dart';
import '../../Widget/reuseable_button.dart';
import '../../Widget/reuseable_textfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passward = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  final signcontroller = Get.put(SignUpController());
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
                      "Sign Up",
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
                            hint: "Enter your name",
                            textEditingController: name,
                            validator: "Enter a valid Name",
                          ),
                          SizedBox(
                            height: 14,
                          ),
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
                            validator: "Enter a valid password",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ReuseableButton(
                      text: "Submit",
                      onclick: () {
                        final isValid = _formKey.currentState?.validate();

                        if (isValid == true) {
                          signcontroller.signup(
                              context, email.text, passward.text, name.text);
                        }
                      },
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have not any account?",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "Sign",
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
    ;
  }
}
