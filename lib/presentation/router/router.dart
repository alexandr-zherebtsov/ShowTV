import 'package:get/get.dart';
import 'package:show_tv/presentation/binding/main_binding.dart';
import 'package:show_tv/presentation/ui/main/main_imports.dart';

class AppRoutes {
  static const String main = '/main';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.main, page:() => MainScreen(), binding: MainBinding()),
  ];
}