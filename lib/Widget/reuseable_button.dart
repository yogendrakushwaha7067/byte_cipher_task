import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task/Utils/const_value.dart';

class ReuseableButton extends StatelessWidget {
  final String text;
  final VoidCallback onclick;
  const ReuseableButton({required this.text, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: ConstColor.textfieldcolor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "${text}",
            style: TextStyle(
                color: ConstColor.buttontextcolor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
