import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unslash/controller/home_controllers/getimages_controller.dart';
import 'package:unslash/core/class/handelingview.dart';
import 'package:unslash/view/widget/home/homeimagecard.dart';
import 'package:unslash/view/widget/search/appsearchwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeImagesControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:AppSearchWidget(),
      ),
      body: GetBuilder<HomeImagesControllerImp>(
        builder: (controller) {
          return HandelingView(
              statusRequest: controller.statusRequest!,
              widget: GridView.builder(
                controller: controller.scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 3
                ),
                itemCount: controller.screens,
                padding: const EdgeInsets.all(2),
                itemBuilder: (context, index) {
                  return HomeImageCard(
                 imageModel:    controller.imagesList[index],
                  );
                },
              ));
        },
      ),
    );
  }
}
// ListView.builder(
// itemCount: controller.imagesList.length,
// itemBuilder: (context, index) {
// return Image.network(
// controller.imagesList[index].urls!.regular.toString());
// },
// )
