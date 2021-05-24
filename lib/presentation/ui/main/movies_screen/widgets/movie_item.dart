part of main;

Widget _movieItem(MovieModel e) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      width: Get.size.width / 2 - 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.colorBlack.withOpacity(0.1),
            child: AspectRatio(
              aspectRatio: 27 / 40,
              child: Image.network(
                e.poster,
                key: UniqueKey(),
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, _, error) => Icon(
                  Icons.error_outline,
                  size: 56,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RatingBarIndicator(
                  itemSize: 21,
                  rating: (e.votes / 2) - 0.5,
                  itemBuilder: (context, index) {
                    return (index + 1) <= ((e.votes / 2)) ? Icon(
                      Icons.star,
                      color: AppColors.colorYellow,
                    ) : Icon(
                      Icons.star_border,
                      color: AppColors.colorYellow,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    e.votes.toString(),
                    style: Get.theme.textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              e.name!,
              style: Get.theme.textTheme.headline2,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
        ],
      ),
    ),
  );
}