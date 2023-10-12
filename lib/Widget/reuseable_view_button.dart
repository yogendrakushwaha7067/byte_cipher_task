import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task/Utils/const_value.dart';

class ReuseableViewButton extends StatelessWidget {
  final String text;
  final VoidCallback onclick;
  ReuseableViewButton({required this.text, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: ConstColor.textfieldcolor,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [
                ConstColor.linear2,
                ConstColor.linear1,
              ],
              stops: [
                0.0,
                1.0
              ],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.topLeft,
              tileMode: TileMode.repeated),
        ),
        child: Text(
          "${text}",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
