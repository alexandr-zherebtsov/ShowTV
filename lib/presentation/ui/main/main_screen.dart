part of main;

class MainScreen extends StatelessWidget {
  final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Obx(() => Scaffold(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Get.theme.appBarTheme.color,
          title: mainController.isSearch.value && mainController.currentPage.value == 0 ? Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: TextField(
              autofocus: true,
              cursorColor: AppColors.colorWhite,
              controller: mainController.searchTEC.value,
              decoration: InputDecoration(
                hintText: AppLocalization.textSearch,
              ),
              onChanged: (v) => mainController.searchMovies(),
            ),
          ) : Hero(
            tag: 'appLogo',
            child: Image.asset(
              AssetsPath.icShowTvLogo,
              height: 24,
            ),
          ),
          actions: [
            Obx(() => mainController.isBusy.value ? const Offstage() : mainController.currentPage.value == 0 ? mainController.isSearch.value ? IconButton(
              icon: Icon(Icons.clear),
              tooltip: AppLocalization.textClear,
              onPressed: () => mainController.clearSearch(),
              ) : IconButton(
                icon: Icon(Icons.search),
                tooltip: AppLocalization.textSearch,
                onPressed: () => mainController.isSearch(true),
              ) : IconButton(
                icon: Icon(Icons.check_circle_outline),
                tooltip: AppLocalization.textSave,
                onPressed: () => mainController.saveAnswers(),
              ),
            ),
          ],
        ),
        body: Obx(() => mainController.isBusy.value ? isBusyScreen()
            : mainController.screens.elementAt(mainController.currentPage.value)),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 12.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: mainController.currentPage.value,
          backgroundColor: Get.theme.bottomNavigationBarTheme.backgroundColor,
          selectedItemColor: Get.theme.bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor: Get.theme.bottomNavigationBarTheme.unselectedItemColor,
          onTap: (index) => mainController.changeCount(index),
          selectedLabelStyle: Get.theme.bottomNavigationBarTheme.selectedLabelStyle,
          unselectedLabelStyle: Get.theme.bottomNavigationBarTheme.unselectedLabelStyle,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.dashboard_outlined),
              activeIcon: const Icon(Icons.dashboard),
              label: AppLocalization.textMovies,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.assignment_outlined),
              activeIcon: const Icon(Icons.assignment),
              label: AppLocalization.textTest,
            ),
          ],
        ),
      ),
    ),
  );
}
