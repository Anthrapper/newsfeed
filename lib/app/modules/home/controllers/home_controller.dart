import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsfeed/app/modules/home/views/comments.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var newsFeedData = [].obs;
  var commentData = [].obs;
  var pressed = false.obs;
  var visible = true.obs;
  var offLineKeys = [].obs;
  var offLineData = [].obs;
  var bookmarkshowList = [].obs;
  Future getBookMarks() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    offLineKeys.assignAll(keys);
    print(offLineKeys);
    final prefsMap = <String, dynamic>{};
    for (String key in keys) {
      prefsMap[key] = prefs.get(key);
    }

    offLineData.assign(prefsMap);
    print(offLineData);
  }

  Future bookMark(String id, String pic, String title, String name) async {
    List<String> bookmark = [];
    bookmark.add(pic);
    bookmark.add(title);
    bookmark.add(name);
    print(bookmark);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(id, bookmark);
    await getBookMarks();
  }

  Future getComments() async {
    try {
      var response = await http.get(
        Uri.parse("http://cookbookrecipes.in/test.php"),
      );
      Get.back();

      print(response.statusCode);

      if (response.statusCode == 200) {
        commentData.assignAll(json.decode(response.body));
        print(commentData);
        Get.to(() => const Comments());
      } else {
        log('Something went wrong');
      }
    } on SocketException catch (e) {
      print(e.message);
    }
  }

  Future getRequest() async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas"),
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        newsFeedData.assignAll(json.decode(response.body));
        print(newsFeedData);
        for (int x = 0; x < newsFeedData.length; x++) {
          bookmarkshowList.add(false);
        }
        print(newsFeedData);
      } else {
        log('Something went wrong');
      }
    } on SocketException catch (e) {
      print(e.message);
    }
  }

  @override
  void onInit() async {
    await getRequest();
    await getBookMarks();
    super.onInit();
  }

  @override
  void onClose() {}
}
