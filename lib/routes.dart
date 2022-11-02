
import 'package:get/get.dart';
import 'package:unslash/core/constant/approutes.dart';
import 'package:unslash/view/screen/favorites.dart';
import 'package:unslash/view/screen/home.dart';
import 'view/screen/imagedata.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.home,
    page: () =>  const HomePage(),
  ),
  GetPage(
    name: AppRoute.imagedata,
    page: () =>    const ImageDataPage(),
  ),
  GetPage(
    name: AppRoute.favImages,
    page: () =>   const FavoritesPage(),
  ),

];
