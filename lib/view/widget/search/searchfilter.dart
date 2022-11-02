import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unslash/controller/home_controllers/getimages_controller.dart';
import 'package:unslash/data/model/imageModel.dart';

// ignore: must_be_immutable
class SearchFilter extends StatelessWidget {
  SearchFilter({Key? key, required this.query}) : super(key: key);
  String query;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeImagesControllerImp>(builder: (controller) {
      List<ImageModel> filterNames = controller.imagesList
          .where((element) =>
              element.user!.name.toString().toLowerCase().trim().contains(
                    query.toLowerCase().trim(),
                  ))
          .toList();

      return Container(
        height: double.maxFinite,
        child: ListView.builder(
          itemCount: filterNames.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              query != ''
                  ? controller.goToItemDataPage(filterNames[index])
                  : controller.goToItemDataPage(controller.imagesList[index]);
            },
            child: ListTile(
              title: query != ''
                  ? Text(
                      filterNames[index].user!.name.toString(),
                    )
                  : Text(
                      controller.imagesList[index].user!.name
                              .toString() ??
                          'name',
                    ),
              trailing: query != ''
                  ? Text(
                      filterNames[index].description??'',
                    )
                  : Text(
                      controller.imagesList[index].description??'',
                      style: const TextStyle(fontSize: 8),
                    ),
            ),
          ),
        ),
      );
    });
  }
}
