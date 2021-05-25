part of splash;

class SplashController extends GetxController {
  Rx<Color> bgColor = AppColors.colorBlue_2.obs;

  @override
  Future<void> onInit() async{
    super.onInit();
    await futureDelayed(1000);
    bgColor.value = AppColors.colorBlue_1;
    await futureDelayed(1000);
    navToMain();
  }

  void navToMain() => Get.offAllNamed(AppRoutes.main);
}
