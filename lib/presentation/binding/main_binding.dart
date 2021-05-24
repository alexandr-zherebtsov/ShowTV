import 'package:get/get.dart';
import 'package:show_tv/presentation/ui/main/main_imports.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
