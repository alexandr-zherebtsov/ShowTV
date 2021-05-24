part of main;

Widget _emptyView(String text) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.info_outline,
          size: 110.0,
          color: AppColors.colorWhite,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            text,
            style: Get.theme.textTheme.headline1,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ],
    ),
  );
}