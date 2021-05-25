part of main;

class _MoviesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find<MainController>();
    return Obx(() => mainController.searchMoviesList.isNotEmpty && mainController.isSearch.value
        ? _searchMovies(mainController) : mainController.isSearch.value
        ? mainController.searchTEC.value.text.length == 0 ? _emptyView(AppLocalization.textSearch, icon: Icons.search)
        : _emptyView(AppLocalization.textNoResults) : _allMovies(mainController),
    );
  }

  Widget _allMovies(MainController mainController) {
    return mainController.movies.isEmpty ? _emptyView(AppLocalization.textNoFilms) : SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Wrap(
          children: mainController.movies.map((e) => _movieItem(e, () => mainController.navToMovie(e))).toList(),
        ),
      ),
    );
  }

  Widget _searchMovies(MainController mainController) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Wrap(
          children: mainController.searchMoviesList.map((e) => _movieItem(e, () => mainController.navToMovie(e))).toList(),
        ),
      ),
    ) ;
  }
}
