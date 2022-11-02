

import 'package:unslash/core/class/crud.dart';

class TestData{

  Crud crud;
  TestData(this.crud);

  getData()async{
    var response = await crud.postData('AppLinks.getUsersLink', {});
   return response.fold((l) => l, (r) => r);
  }


}