import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/home_controller.dart';
import '../../Controllers/sign_in_controller.dart';
import '../../Widget/reuseable_container.dart';
import '../profile/add_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homecontroller = Get.put(HomeScreenController());
  getdata() async {
    await homecontroller.getData(context);
  }

  final scrollcontrolller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    scrollcontrolller.addListener(() async {
      if (scrollcontrolller.position.pixels ==
          scrollcontrolller.position.maxScrollExtent) {
        homecontroller.updatepage();
        homecontroller.updatebool(true);
        await homecontroller.paginate(context);
        homecontroller.updatebool(false);
      } else {
        // print("${bandcontroller.page}");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    homecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "HireTheART",
          style: TextStyle(
              color: Color(0xff616163),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                Get.to(() => AddUserProducts());
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: GetBuilder(
          init: HomeScreenController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                      controller: scrollcontrolller,
                      shrinkWrap: true,
                      itemCount: homecontroller.isloading == true
                          ? homecontroller.list.length + 1
                          : homecontroller.list.length,
                      itemBuilder: (context, index) {
                        if (index < homecontroller.list.length) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Reuseablecontainer(
                              email: "${controller.list?[index].email}",
                              location: "${controller.list?[index].location}",
                              name: "${controller.list?[index].name}",
                              imageurl:
                                  "${controller.list?[index].profilepicture}",
                              onClick: () {
                                Get.to(() => ProfileScreen(
                                      id: "${controller.list?[index].id}",
                                    ));
                              },
                            ),
                          );
                        } else {
                          return SizedBox(
                              height: 50,
                              child:
                                  Center(child: CircularProgressIndicator()));
                        }
                      }),
                ),
              ]),
            );
          }),
    );
  }
}
