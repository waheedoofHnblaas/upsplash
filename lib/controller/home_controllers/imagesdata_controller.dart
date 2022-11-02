import 'dart:convert';
import 'package:get/get.dart';
import 'package:unslash/core/services/services.dart';
import 'package:unslash/data/model/imageModel.dart';
import 'package:gallery_saver/gallery_saver.dart';
abstract class ImageDataController extends GetxController {
  setFav(ImageModel imageModel);

  isFav(ImageModel imageModel);
}

class ImagesDataControllerImp extends ImageDataController {
  MyServices myServices = Get.find();
  ImageModel imageModel = ImageModel();

  bool isFavorite = false;

  @override
  Future<void> onInit() async {
    imageModel =Get.arguments[ImageModel];
    print('===================');
    update();

    isFav(imageModel);
    super.onInit();
  }

  @override
  setFav(ImageModel imageModel) async {
    if (myServices.sharedPreferences.containsKey('fav : ${imageModel.id}')) {
      myServices.sharedPreferences.remove('fav : ${imageModel.id}');
    } else {
      myServices.sharedPreferences.setString(
        'fav : ${imageModel.id}',
        jsonEncode(imageModel).toString(),
      );
    }

    isFav(imageModel);
    update();
    print(jsonEncode(imageModel).toString());
  }

  @override
  bool isFav(ImageModel imageModel) {
    if (myServices.sharedPreferences.containsKey('fav : ${imageModel.id}')) {
      isFavorite = false;
      return false;
    } else {
      isFavorite = true;
      return true;
    }
  }

  download(path)async{
   await GallerySaver.saveImage(path,toDcim: true,albumName: 'unsplash');
  }

}
