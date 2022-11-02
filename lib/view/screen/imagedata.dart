
import 'package:flutter/material.dart';
import 'package:unslash/controller/home_controllers/imagesdata_controller.dart';
import 'package:get/get.dart';
import 'package:unslash/data/model/imageModel.dart';
import 'package:unslash/view/widget/home/appcardnamerow.dart';

class ImageDataPage extends StatelessWidget {
  const ImageDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ImagesDataControllerImp());
    return GetBuilder<ImagesDataControllerImp>(
      builder: (controllerImp) {
        if (controllerImp.imageModel != ImageModel()) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: AppBarTitle(controllerImp),
            ),
            body: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 29),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageCard(controllerImp),
                    AppCradNameRow(controllerImp: controllerImp),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

AppBarTitle(controllerImp) {
  return Text(controllerImp.imageModel == ImageModel()
      ? ''
      : controllerImp.imageModel.user!.name.toString());
}

Widget ImageCard(controllerImp) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
    ),
    height: Get.height / 1.5,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.network(
        fit: BoxFit.cover,
        controllerImp.imageModel.urls!.small.toString(),
      ),
    ),
  );
}
