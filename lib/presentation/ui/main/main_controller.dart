part of main;

class MainController extends GetxController {
  final JsonDecoder _decoder = JsonDecoder();
  final MoviesRepository _moviesRepository = Get.find();
  final Rx<TextEditingController> searchTEC = TextEditingController().obs;
  RxBool isBusy = false.obs;
  RxBool isSearch = false.obs;
  List<Widget> screens = <Widget>[];
  RxList<MovieModel> movies = <MovieModel>[].obs;
  RxList<MovieModel> searchMoviesList = <MovieModel>[].obs;

  @override
  void onInit() async {
    isBusy(true);
    screens = [
      _MoviesScreen(),
      _TestScreen(),
    ];
    await getMovies();
    super.onInit();
    isBusy(false);
  }

  RxInt currentPage = 0.obs;
  int changeCount(int value) => currentPage.value = value;

  Future<void> getMovies() async {
    try {
      MovieResponse res = await _moviesRepository.getMovie();
      movies.value = res.result;
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  void searchMovies() {
    searchMoviesList.clear();
    if(searchTEC.value.text.isNotEmpty) {
      for(int i = 0; i < movies.length; i++) {
        if(movies[i].name!.replaceAll(' ', '').trim().toLowerCase().contains(searchTEC.value.text.replaceAll(' ', '').trim().toLowerCase())
            || movies[i].votes.toString().replaceAll(' ', '').trim().toLowerCase()
                .startsWith(searchTEC.value.text.replaceAll(' ', '').trim().toLowerCase())
        ) {
          searchMoviesList..add(movies[i]);
        }
      }
    }
    searchTEC.refresh();
    update();
  }

  void clearSearch() {
    isSearch(false);
    searchMoviesList.clear();
    searchTEC.value.clear();
  }
}