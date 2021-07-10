import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newsfeed/app/modules/home/views/body.dart';
import 'package:newsfeed/app/modules/home/views/bottom_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final appBar = AppBar(
    backgroundColor: Colors.grey[100],
    elevation: 1,
    leading: const Icon(
      Icons.camera_alt_outlined,
      color: Colors.black,
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: Get.height * 0.045,
          child: Image.asset("assets/images/insta_logo.png"),
        ),
        const Icon(
          FontAwesomeIcons.paperPlane,
          color: Colors.black,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: InstagramBody(),
      bottomNavigationBar: SizedBox(
        height: Get.height * 0.055,
        child: const FeedBottomBar(),
      ),
    );
  }
}
