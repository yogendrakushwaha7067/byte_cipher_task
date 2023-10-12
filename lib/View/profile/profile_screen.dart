import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/gallery_controller.dart';
import '../../Controllers/user_profile_controller.dart';
import '../../Widget/reuseable_container.dart';

class ProfileScreen extends StatefulWidget {
  String id;
  ProfileScreen({required this.id});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userprofilecontroller = Get.put(UserProfileController());
  final gallerycontroller = Get.put(GalleryController());

  getdata() async {
    await userprofilecontroller.userprofile(context, widget.id);
    await gallerycontroller.imageget(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  // int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Profile Details",
            style: TextStyle(
                color: Color(0xff616163),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: GetBuilder(
            init: UserProfileController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  // physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Reuseablecontainer(
                        email: "${controller.profilemodel.email}",
                        location: "${controller.profilemodel.location}",
                        name: "${controller.profilemodel.name}",
                        imageurl: "${controller.profilemodel.profilepicture}",
                        istrue: true,
                        onClick: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          color: Color(0xff616163),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GetBuilder(
                          init: GalleryController(),
                          builder: (controller) {
                            return Column(
                              children: [
                                CarouselSlider(
                                    items: [
                                      ReusableGrid(
                                          gallerycontroller: gallerycontroller,
                                          indexx: 0),
                                      ReusableGrid(
                                          gallerycontroller: gallerycontroller,
                                          indexx: 1),
                                      ReusableGrid(
                                        gallerycontroller: gallerycontroller,
                                        indexx: 2,
                                      ),
                                    ],
                                    options: CarouselOptions(
                                      height: 330,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 1,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: false,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.3,
                                      onPageChanged: (index, value) {
                                        gallerycontroller.updatecurrent(index);
                                        print(index);
                                        setState(() {});
                                      },
                                      scrollDirection: Axis.horizontal,
                                    )),
                                SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return gallerycontroller.current ==
                                                index
                                            ? RotationTransition(
                                                turns:
                                                    new AlwaysStoppedAnimation(
                                                        90 / 360),
                                                child: Container(
                                                  width: 12.0,
                                                  height: 8.0,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 4.0),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Color(0xff7F69D4)),
                                                ),
                                              )
                                            : Container(
                                                width: 12.0,
                                                height: 12.0,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 4.0),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff7F69D4)
                                                        .withOpacity(.25)),
                                              );
                                      }),
                                )
                              ],
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

class ReusableGrid extends StatelessWidget {
  final int indexx;
  ReusableGrid({
    super.key,
    required this.gallerycontroller,
    required this.indexx,
  });

  final GalleryController gallerycontroller;

  @override
  Widget build(BuildContext context) {
    int startIndex = indexx * 9;

    return Container(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: (gallerycontroller.list.length) > 9 ? 9 : 0,
          //   physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns in the grid
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
          ),
          itemBuilder: (BuildContext context, index) {
            return Material(
              elevation: 4,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "${gallerycontroller.list[index + startIndex].thumbnailUrl}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
