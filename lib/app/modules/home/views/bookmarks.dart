import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newsfeed/app/modules/home/controllers/home_controller.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Bookmarked Posts',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Obx(() {
                return Get.find<HomeController>().offLineKeys.isNotEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            Get.find<HomeController>().offLineKeys.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 16.0, 8.0, 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: Get.height * 0.05,
                                          width: Get.width * 0.1,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  "https://toppng.com/uploads/preview/instagram-default-profile-picture-11562973083brycehrmyv.png"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          Get.find<HomeController>()
                                                  .offLineData[0][
                                              Get.find<HomeController>()
                                                  .offLineKeys[index]][2],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.more_vert),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ),
                              Image.network(
                                Get.find<HomeController>().offLineData[0][
                                    Get.find<HomeController>()
                                        .offLineKeys[index]][0],
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        IconButton(
                                          icon: const Icon(
                                              FontAwesomeIcons.heart),
                                          color: Colors.black,
                                          onPressed: () {},
                                        ),
                                        const SizedBox(
                                          width: 16.0,
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.comment,
                                        ),
                                        const SizedBox(
                                          width: 16.0,
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.paperPlane,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.08),
                                child: const Text(
                                  "Liked by neeharika_boda and 56676 others",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.08,
                                  vertical: Get.height * 0.01,
                                ),
                                child: Text(
                                    Get.find<HomeController>().offLineData[0][
                                        Get.find<HomeController>()
                                            .offLineKeys[index]][1]),
                              ),
                            ],
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          'No Bookmarks yet',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
