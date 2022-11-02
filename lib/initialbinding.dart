import 'package:get/get.dart';
import 'package:unslash/core/services/services.dart';


import 'core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());

  }
}
