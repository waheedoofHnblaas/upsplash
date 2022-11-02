import 'package:flutter/material.dart';
import 'package:unslash/controller/home_controllers/favorite_controller.dart';
import 'package:get/get.dart';
import 'package:unslash/view/widget/home/homeimagecard.dart';
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: GetBuilder<FavoriteControllerImp>(
        builder: (controller) {
          if(controller.favImagesList.isEmpty){
            return const Center(child:Text('No Favorite Images Yet'));
          }else{
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 3),
              itemCount: controller.favImagesList.length,
              padding: const EdgeInsets.all(2),
              itemBuilder: (context, index) {
                return HomeImageCard(
                  imageModel: controller.favImagesList[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
