part of main;

Widget _emptyView(String text, {IconData icon: Icons.info_outline}) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
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