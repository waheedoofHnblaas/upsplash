import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unslash/core/class/statusrequest.dart';
import 'package:unslash/core/constant/approutes.dart';
import 'package:unslash/core/function/handlingdata.dart';
import 'package:unslash/core/services/services.dart';
import 'package:unslash/data/datasource/remote/home/homeData.dart';
import 'package:unslash/data/model/imageModel.dart';

abstract class HomeImagesController extends GetxController {
  Future<List<ImageModel>> getImages();
  toData(ImageModel imageModel);
}

class HomeImageControllerImp extends HomeImagesController {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;
  final HomeData homeData = HomeData(Get.find());
  List<ImageModel> imagesList = [];

  ScrollController scrollController = ScrollController();
  int screens = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    scrollController.addListener(() async {
      print('pixels ');
      print(scrollController.position.pixels);
      print('maxScrollExtent ');
      print(scrollController.position.maxScrollExtent);
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          screens < imagesList.length-1) {
        screens += 2;
        update();
      }
    });
    await getImages();

  }

  @override
  Future<List<ImageModel>> getImages() async {
    print('==========getImages==========');
    statusRequest = StatusRequest.loading;
    update();
    print('getHomeData');
    imagesList.clear();
    var response = await homeData.homeData();
    statusRequest = handlingData(response);

    print('==========$statusRequest==========');
    if (statusRequest == StatusRequest.success) {
      print('==========success==========');
      if (response.isNotEmpty) {
        List images = response;
        for (var element in images) {
          imagesList.add(ImageModel.fromJson(element));
          print(ImageModel.fromJson(element).id);
          print('====================');
        }
        screens = imagesList.length ~/ 2;
        update();
      } else {
        Get.defaultDialog(
          title: 'Warning',
          titleStyle: Get.textTheme.headline1,
          middleText: 'no data available',
          middleTextStyle: Get.textTheme.bodyText1,
          backgroundColor: Get.theme.backgroundColor,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Get.theme.backgroundColor,
      messageText: const Center(
          child: Text(
        'done update',
        style: TextStyle(color: Colors.greenAccent),
      )),
      duration: const Duration(
        seconds: 2,
      ),
    ));
    update();
    return imagesList;
  }



  @override
  void toData(ImageModel imageModel) {
    print(imageModel);
    Get.toNamed(AppRoute.imagedata,arguments: {ImageModel : imageModel});
  }
}
