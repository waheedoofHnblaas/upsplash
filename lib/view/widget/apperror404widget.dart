import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:unslash/controller/home_controllers/getimages_controller.dart';


class AppEroor404Widget extends StatelessWidget {
  AppEroor404Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeImageControllerImp>(
      builder: (controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //  Lottie.asset(AppImagesAssets.error),
              const Icon(Icons.error),
              const Text('no connction'),
              SizedBox(height: 100,),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () async{
                        await controller.getImages();
                      },
                      icon: const Icon(Icons.refresh)),
                ),
              ),
              SizedBox(height: 100,),
            ],
          ),
        );
      }
    );
  }
}
