import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Utils/const_value.dart';

class ReuseableTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  final String validator;

  const ReuseableTextField(
      {required this.textEditingController,
      required this.hint,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: ConstColor.textfieldcolor.withOpacity(0.6),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          hintText: hint,
          hintStyle: TextStyle(
            color: ConstColor.buttontextcolor,
            fontSize: 15,
          ),
          errorStyle: TextStyle(color: Colors.white)),
      validator: (value) {
        if (value?.isEmpty == true) {
          return '${validator}';
        }
        return null;
      },
    );
  }
}
