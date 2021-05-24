import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:show_tv/common/colors.dart';
import 'package:show_tv/common/localization.dart';
import 'package:show_tv/common/theme_data.dart';
import 'package:show_tv/presentation/binding/global_binding.dart';
import 'package:show_tv/presentation/router/router.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: AppColors.brightnessLight,
      statusBarIconBrightness: AppColors.brightnessLight,
      statusBarColor: AppColors.colorBlue_3,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppLocalization.textShowTV,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.main,
      defaultTransition: Transition.cupertino,
      theme: AppThemeData.appTheme,
      initialBinding: GlobalBinding(),
    );
  }
}