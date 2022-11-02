import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unslash/controller/home_controllers/searchcontroller.dart';
import 'package:unslash/view/widget/search/datasearch.dart';

class AppSearchWidget extends StatelessWidget {
  AppSearchWidget(
      {Key? key, this.title = 'Splash Images', this.showback = false})
      : super(key: key);

  late String title;
  late bool showback;

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return SizedBox(
      width: Get.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
              child: Text(
            title,
          )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {
                if (showback) {
                  Get.back();
                } else {
                  showSearch(
                    context: context,
                    delegate: DataSearch(),
                  );
                }
              },
              icon: Icon(
                showback ? CupertinoIcons.back : CupertinoIcons.search,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
