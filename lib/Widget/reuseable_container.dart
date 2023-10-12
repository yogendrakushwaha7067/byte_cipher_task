import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task/Widget/reuseable_view_button.dart';

import '../Utils/const_value.dart';

class Reuseablecontainer extends StatelessWidget {
  final String name;
  final String email;
  final String location;
  final String imageurl;
  VoidCallback onClick;
  final bool istrue;
  Reuseablecontainer(
      {required this.email,
      required this.location,
      required this.name,
      required this.imageurl,
      this.istrue = false,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(children: [
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: imageurl != "null"
                  ? Image.network(
                      "${imageurl}",
                      fit: BoxFit.cover,
                    )
                  : SizedBox.shrink(),
            )),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffF2F2F2),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${name}",
                    style: TextStyle(
                        color: Color(0xff616163),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${email}",
                    style: TextStyle(
                      color: Color(0xff616163),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${location}",
                    style: TextStyle(
                      color: Color(0xff616163),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  istrue
                      ? SizedBox.shrink()
                      : ReuseableViewButton(
                          onclick: onClick, text: "View Profile"),
                  SizedBox(
                    height: 14,
                  ),
                ]),
              ),
            )
          ]),
          istrue
              ? SizedBox.shrink()
              : Positioned(
                  left: 10,
                  top: 208,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ConstColor.textfieldcolor,
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
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
