import 'package:unslash/core/class/crud.dart';
import 'package:unslash/links.dart';

class GetImage {
  Crud crud;

  GetImage(this.crud);

  getImage(id) async {
    var response = await crud.getData(
        '${AppLinks.firstfavoriteDataLink}id${AppLinks.secondfavoriteDataLink}');
    return response.fold((l) => l, (r) => r);
  }
}
