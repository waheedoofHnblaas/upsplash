import 'package:flutter/material.dart';
import 'package:unslash/controller/home_controllers/imagesdata_controller.dart';
import 'package:get/get.dart';

class AppCradNameRow extends StatelessWidget {
  AppCradNameRow({Key? key, required this.controllerImp}) : super(key: key);

  ImagesDataControllerImp controllerImp;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.black.withOpacity(0.3),
        ),
        child: GetBuilder<ImagesDataControllerImp>(builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  await controllerImp.setFav(controllerImp.imageModel);
                },
                icon: FavIcon(controllerImp.isFavorite),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                controllerImp.imageModel.user!.name.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 11,
              ),
              IconButton(
                onPressed: () async {
                  ShowSnackbar(
                    const Icon(
                      Icons.download,
                    ),
                    '${controllerImp.imageModel.user!.firstName}',
                    'downloading',
                  );

                  await controllerImp.download(
                    "${controllerImp.imageModel.urls!.small}.jpg",
                  );
                  ShowSnackbar(
                    const Icon(
                      Icons.download,
                      color: Colors.greenAccent,
                    ),
                    '${controllerImp.imageModel.user!.firstName}',
                    'done in the gallery',
                  );
                },
                icon: const Icon(
                  Icons.arrow_circle_down_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

}

Widget FavIcon(isFavorite) {
  return isFavorite
      ? const Icon(
          Icons.favorite_border,
          color: Colors.white,
        )
      : const Icon(
          Icons.favorite,
          color: Colors.red,
        );
}

SnackbarController ShowSnackbar(icon, text1, text2) {
  return Get.showSnackbar(GetSnackBar(
    duration: const Duration(seconds: 8),
    backgroundColor: Colors.white,
    icon: icon,
    titleText: Text(text1),
    messageText: Text(text2),
  ));
}