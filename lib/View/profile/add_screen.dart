import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/add_user_controller.dart';
import '../../Controllers/sign_in_controller.dart';
import '../../Utils/const_value.dart';
import '../../Widget/reuseable_button.dart';
import '../../Widget/reuseable_textfield.dart';

class AddUserProducts extends StatefulWidget {
  const AddUserProducts({super.key});

  @override
  State<AddUserProducts> createState() => _AddUserProductsState();
}

class _AddUserProductsState extends State<AddUserProducts> {
  TextEditingController name = TextEditingController();
  TextEditingController emai = TextEditingController();
  TextEditingController location = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  final addusercontroller = Get.put(AddUserControlller());
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
                      "Add User",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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
                            height: 12,
                          ),
                          ReuseableTextField(
                            hint: "Email-id",
                            textEditingController: emai,
                            validator: "Enter a valid Email",
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          ReuseableTextField(
                            hint: "location",
                            textEditingController: location,
                            validator: "Enter a valid Location",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ReuseableButton(
                      text: "Add",
                      onclick: () async {
                        final isValid = _formKey.currentState?.validate();

                        if (isValid == true) {
                          await addusercontroller.useradd(
                              context, emai.text, name.text, location.text);
                          // signcontroller.login(
                          //     context, email.text, passward.text);
                        }
                      },
                    ),
                  ]),
            ),
          )),
    );
    ;
  }
}
