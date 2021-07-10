import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newsfeed/app/modules/home/controllers/home_controller.dart';

class InstagramBody extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Obx(
            () => ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.newsFeedData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      "https://avatanplus.com/files/resources/original/5bb23ac06077d16630357f8b.jpg",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                controller.newsFeedData[index]["channelname"],
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
                    SizedBox(
                      height: Get.height * 0.269,
                      child: Image.network(
                        controller.newsFeedData[index]["medium thumbnail"],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(FontAwesomeIcons.heart),
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
                          Obx(() => IconButton(
                                icon: Icon(
                                  controller.bookmarkshowList[index]
                                      ? Icons.bookmark
                                      : FontAwesomeIcons.bookmark,
                                ),
                                onPressed: () {
                                  controller.bookmarkshowList[index] = true;

                                  controller.bookMark(
                                    controller.newsFeedData[index]['id'],
                                    controller.newsFeedData[index]
                                        ['medium thumbnail'],
                                    controller.newsFeedData[index]['title'],
                                    controller.newsFeedData[index]
                                        ["channelname"],
                                  );
                                },
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.08),
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
                      child: controller.newsFeedData[index]['title'].length > 50
                          ? Obx(
                              () => Stack(
                                children: [
                                  Text(
                                    controller.pressed.value
                                        ? "${controller.newsFeedData[index]['title']}"
                                        : "${controller.newsFeedData[index]['title'].toString().substring(0, 50)} ...",
                                    style: const TextStyle(
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: InkWell(
                                      onTap: () {
                                        controller.pressed.toggle();
                                      },
                                      child: Text(
                                        controller.pressed.value
                                            ? 'Less'
                                            : 'More',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text(
                              controller.newsFeedData[index]['title'],
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.08,
                        vertical: Get.height * 0.001,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.dialog(
                            const Center(child: CircularProgressIndicator()),
                            barrierDismissible: false,
                          );
                          controller.getComments();
                        },
                        child: const Text(
                          "View all comments",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
