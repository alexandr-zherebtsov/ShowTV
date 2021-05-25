import 'package:get/get.dart';
import 'package:show_tv/presentation/binding/main_binding.dart';
import 'package:show_tv/presentation/binding/splash_binding.dart';
import 'package:show_tv/presentation/ui/main/main_imports.dart';
import 'package:show_tv/presentation/ui/splash/splash_imports.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String main = '/main';
  static const String movie = '/movie';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page:() => SplashScreen(), binding: SplashBinding()),
    GetPage(name: AppRoutes.main, page:() => MainScreen(), binding: MainBinding()),
  ];
}
