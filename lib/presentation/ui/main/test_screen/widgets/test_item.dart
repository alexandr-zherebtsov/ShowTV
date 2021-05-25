part of main;

Widget _testItem(QuestionModel e, MainController mainController) {
  return Column(
    children: [
      Center(
        child: Container(
          width: 70,
          height: 70,
          margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.colorWhite),
          ),
          child: Center(
            child: Text(
              (e.id + 1).toString(),
              style: Get.theme.textTheme.headline1,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                e.question,
                style: Get.theme.textTheme.headline3,
                softWrap: true,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: e.answers.map((ans) => _answerItem(ans, e, mainController)).toList(),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _answerItem(AnswerModel qwe, QuestionModel e, MainController mainController) {
  return Obx(() =>
    MaterialButton(
      minWidth: 10,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      elevation: 0.0,
      focusElevation: 0.0,
      highlightElevation: 0.0,
      disabledElevation: 0.0,
      hoverElevation: 0.0,
      color: e.result!.value == 100 ? AppColors.colorTransparent
          : e.result!.value == qwe.num ? AppColors.colorBlue_2
          : AppColors.colorTransparent,
      child: Text(
        qwe.answer,
        style: Get.theme.textTheme.caption,
      ),
      onPressed: () => mainController.getQweRes(qwe, e),
    ),
  );
}