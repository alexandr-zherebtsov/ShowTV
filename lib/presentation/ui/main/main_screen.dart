part of main;

class MainScreen extends StatelessWidget {
  final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Obx(() => mainController.isBusy.value ? _isBusyScreen() : Scaffold(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Get.theme.appBarTheme.color,
          title: mainController.isSearch.value && mainController.currentPage.value == 0 ? TextField(
            autofocus: true,
            cursorColor: AppColors.colorWhite,
            controller: mainController.searchTEC.value,
            decoration: InputDecoration(
              hintText: AppLocalization.textSearch,
            ),
            onChanged: (v) => mainController.searchMovies(),
          ) : Text(
            AppLocalization.textShowTV,
            style: Get.theme.appBarTheme.titleTextStyle,
          ),
          actions: [
            Obx(() => mainController.currentPage.value == 0 ? mainController.isSearch.value ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => mainController.clearSearch(),
              ) : IconButton(
                icon: Icon(Icons.search),
                onPressed: () => mainController.isSearch(true),
              ) : const Offstage(),
            ),
          ],
        ),
        body: Obx(() => mainController.screens.elementAt(mainController.currentPage.value)),
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
              icon: const Icon(Icons.sort),
              activeIcon: const Icon(Icons.menu),
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
