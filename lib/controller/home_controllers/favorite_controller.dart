import 'dart:convert';
import 'package:get/get.dart';
import 'package:unslash/core/services/services.dart';
import 'package:unslash/data/model/imageModel.dart';

abstract class FavController extends GetxController {}

class FavoriteControllerImp extends FavController {
  MyServices myServices = Get.find();
  List<ImageModel> favImagesList = [];

  Future<void> onInit() async {
    await getFavImages();
    update();
  }

  Future<List<ImageModel>> getFavImages() async {
    for (String mapImage in myServices.sharedPreferences.getKeys()) {
      print(myServices.sharedPreferences.getString(mapImage));
      print(mapImage);
      favImagesList.add(ImageModel.fromJson(
          await jsonDecode(myServices.sharedPreferences.getString(mapImage)!)));
    }

    return favImagesList;
  }
}
