import 'package:flutter/material.dart';
import 'package:unslash/controller/home_controllers/getimages_controller.dart';
import 'package:unslash/data/model/imageModel.dart';
import 'package:get/get.dart';

class HomeImageCard extends StatelessWidget {
  HomeImageCard({required this.imageModel, Key? key}) : super(key: key);

   ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    HomeImageControllerImp homeImagesControllerImp = Get.find();
    return InkWell(
      onTap: () {
        homeImagesControllerImp.toData(imageModel);
      },
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                filterQuality: FilterQuality.low,
                fit: BoxFit.cover,
                imageModel.urls!.small.toString(),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            left: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.black.withOpacity(0.3),
              ),
              child: Center(
                  child: Row(
                children: [
                  // GetBuilder<ImageDataControllerImp>(
                  //     builder: (imageDataControllerImp) {
                  //   return IconButton(
                  //       onPressed: () async {
                  //         await imageDataControllerImp
                  //             .setFav(imageDataControllerImp.imageModel);
                  //       },
                  //       icon: imageDataControllerImp.isFav(imageModel)
                  //           ? const Icon(
                  //               Icons.favorite_border,
                  //               color: Colors.white,
                  //             )
                  //           : const Icon(
                  //               Icons.favorite,
                  //               color: Colors.red,
                  //             ));
                  // }),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 140,
                    child: Text(
                      imageModel.user!.name.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
