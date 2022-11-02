import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unslash/core/class/statusrequest.dart';
import 'package:unslash/core/constant/approutes.dart';
import 'package:unslash/core/function/handlingdata.dart';
import 'package:unslash/core/services/services.dart';
import 'package:unslash/data/datasource/remote/home/homeData.dart';
import 'package:unslash/data/model/imageModel.dart';

abstract class ImageDataController extends GetxController {
 // toData(ImageModel imageModel);
}

class ImageDataControllerImp extends ImageDataController {
  MyServices myServices = Get.find();
  ImageModel imageModel = ImageModel();
  @override
  void onInit() {

    print(Get.arguments);
    imageModel = Get.arguments[ImageModel];
    update();

    super.onInit();
  }


}
