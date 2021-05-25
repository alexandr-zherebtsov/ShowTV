part of main;

class MainController extends GetxController {
  final JsonDecoder _decoder = JsonDecoder();
  final MoviesRepository _moviesRepository = Get.find();
  final Rx<TextEditingController> searchTEC = TextEditingController().obs;
  final ScrollController testSC = ScrollController();

  RxBool isBusy = false.obs;
  RxBool isSearch = false.obs;
  RxInt testNum = 0.obs;
  RxInt requestNum = 99.obs;
  RxString requestWord = AppLocalization.textNormal.obs;

  RxList<QuestionModel> questions = <QuestionModel>[].obs;
  List<Widget> screens = <Widget>[];
  RxList<MovieModel> movies = <MovieModel>[].obs;
  RxList<MovieModel> searchMoviesList = <MovieModel>[].obs;

  RxInt currentPage = 0.obs;
  int changeCount(int value) => currentPage.value = value;

  @override
  void onInit() async {
    isBusy(true);
    screens = [
      _MoviesScreen(),
      _TestScreen(),
    ];
    questions..addAll(TestData.questions);
    await getMovies();
    super.onInit();
    isBusy(false);
  }

  Future<void> getMovies() async {
    try {
      MovieResponse res = await _moviesRepository.getMovie();
      movies.value = res.result;
    } catch (e) {
      handleErrorApp(e, decoder: _decoder);
    }
  }

  Future<void> getMovieByTest(int genre) async {
    try {
      MovieResponse res = await _moviesRepository.getMovieByTest(genre);
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
  }

  void clearSearch() {
    isSearch(false);
    searchMoviesList.clear();
    searchTEC.value.clear();
  }

  void saveAnswers() {
    checkTest() ? Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.colorWhite,
        clipBehavior: Clip.hardEdge,
        content: Text(
          AppLocalization.textSaveAnswers + AppLocalization.markQuestion,
          style: Get.theme.textTheme.headline1!.copyWith(color: AppColors.colorBlack),
        ),
        actions: [
          MaterialButton(
            colorBrightness: AppColors.brightnessLight,
            child: Text(
              AppLocalization.textCancel,
              style: Get.theme.textTheme.caption!.copyWith(color: AppColors.colorBlack.withOpacity(0.5)),
            ),
            onPressed: () => navBack(),
          ),
          MaterialButton(
            colorBrightness: AppColors.brightnessLight,
            child: Text(
              AppLocalization.textSave,
              style: Get.theme.textTheme.caption!.copyWith(color: AppColors.colorBlue_3),
            ),
            onPressed: () => getTestResult(),
          ),
        ],
      ),
    ) : showSnackBar(title: AppLocalization.textSelectAllAnswers);
  }

  void navToMovie(MovieModel movie) {
    Get.to(() => MovieScreen(movie: movie), binding: MovieBinding());
  }

  void navBack() {
    Get.back();
  }

  /// Test Logic

  bool checkTest() {
    bool res = true;
    for(int i = 0; i < questions.length; i++) {
      if(questions[i].result!.value == 100) {
        res = false;
      }
    }
    return res;
  }

  void getQweRes(AnswerModel qwe, QuestionModel e) {
    e.result!.value = qwe.num;
  }

  Future<void> getTestResult() async {
    isBusy(true);

    navBack();
    testNum.value = 0;

    for(int i = 0; i < questions.length; i++) {
      testNum.value = testNum.value + questions[i].result!.value;
    }

    if (testNum.value <= 0) {
      requestNum.value = 10770; // TV movie
      requestWord.value = AppLocalization.textAwful;
    }
    else if (testNum.value > 0 && testNum.value < 11) {
      requestNum.value = 99; // documentary
      requestWord.value = AppLocalization.textVeryBad;
    }
    else if (testNum.value < 10 && testNum.value < 16) {
      requestNum.value = 18; // drama
      requestWord.value = AppLocalization.textBad;
    }
    else if (testNum.value < 15 && testNum.value < 20) {
      requestNum.value = 27; // horror
      requestWord.value = AppLocalization.textNormal;
    }
    else if (testNum.value < 19 && testNum.value < 26) {
      requestNum.value = 10752; // war
      requestWord.value = AppLocalization.textNormal;
    }
    else if (testNum.value < 25 && testNum.value < 30) {
      requestNum.value = 9648; // mystery
      requestWord.value = AppLocalization.textGood;
    }
    else if (testNum.value < 29 && testNum.value < 37) {
      requestNum.value = 10752; // western
      requestWord.value = AppLocalization.textVeryGood;
    }
    else {
      requestNum.value = 12; // adventure
      requestWord.value = AppLocalization.textGreat;
    }

    currentPage.value = 0;
    await getMovieByTest(requestNum.value);
    for(int i = 0; i < questions.length; i++) {
      questions[i].result!.value = 100;
    }
    await futureDelayed(400);

    isBusy(false);

    showSnackBar(title: AppLocalization.textYourMood + requestWord.value);
  }
}
