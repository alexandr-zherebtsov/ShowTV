part of main;

Widget _isBusyScreen() {
  return Container(
    color: Get.theme.scaffoldBackgroundColor,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}