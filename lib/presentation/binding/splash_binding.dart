import 'package:get/get.dart';
import 'package:show_tv/presentation/ui/splash/splash_imports.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}