import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsfeed/app/modules/home/views/bookmarks.dart';

class FeedBottomBar extends StatelessWidget {
  const FeedBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1,
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              size: 30,
            ),
            onPressed: () {},
          ),
          const IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: null,
          ),
          const IconButton(
            icon: Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
            onPressed: null,
          ),
          const IconButton(
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 30,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: const Icon(
              Icons.bookmark_border,
              size: 30,
            ),
            onPressed: () {
              Get.to(
                () => const BookMarks(),
              );
            },
          ),
        ],
      ),
    );
  }
}
