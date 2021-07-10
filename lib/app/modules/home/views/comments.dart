import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newsfeed/app/modules/home/controllers/home_controller.dart';

class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

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
        backgroundColor: Colors.grey[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Get.width * 0.16,
              ),
              child: const Text(
                'Comments',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const Icon(
              FontAwesomeIcons.paperPlane,
              color: Colors.black,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Flexible(
          child: Obx(
            () => ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: Get.find<HomeController>().commentData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.1,
                        vertical: Get.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
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
                            Padding(
                              padding: EdgeInsets.only(
                                left: Get.width * 0.06,
                              ),
                              child: Text(
                                Get.find<HomeController>().commentData[index]
                                    ['username'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: Get.width * 0.06,
                              ),
                              child: Text(
                                Get.find<HomeController>().commentData[index]
                                    ['comments'],
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Icon(FontAwesomeIcons.heart),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
