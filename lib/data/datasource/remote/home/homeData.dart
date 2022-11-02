import 'package:unslash/core/class/crud.dart';
import 'package:unslash/links.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  homeData() async {
    var response = await crud.getData(AppLinks.homeDataLink,);
    return response.fold((l) => l, (r) => r);
  }
}
