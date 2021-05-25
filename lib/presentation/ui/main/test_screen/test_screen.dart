part of main;

class _TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find<MainController>();
    return CupertinoScrollbar(
      controller: mainController.testSC,
      child: SingleChildScrollView(
        controller: mainController.testSC,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mainController.questions.map((e) => _testItem(e, mainController)).toList()
            ..add(SizedBox(height: 36)),
        ),
      ),
    );
  }
}
