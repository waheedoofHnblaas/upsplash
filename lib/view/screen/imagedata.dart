import 'package:flutter/material.dart';
import 'package:unslash/controller/home_controllers/imagesdata_controller.dart';
import 'package:get/get.dart';

class ImageDataPage extends StatelessWidget {
  const ImageDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageDataControllerImp controllerImp = Get.put(ImageDataControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text( controllerImp.imageModel.user!.name.toString()),),
      body: Center(
        child: Container(

          margin: EdgeInsets.symmetric(horizontal: 29),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Center(
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )),
                        const  SizedBox(width: 5,),
                        Text(
                          controllerImp.imageModel.user!.name.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const  SizedBox(width: 11,),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_circle_down_outlined,
                              color: Colors.white,
                            )),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
