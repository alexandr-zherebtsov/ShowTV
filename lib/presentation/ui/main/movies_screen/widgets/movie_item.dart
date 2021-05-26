part of main;

Widget _movieItem(MovieModel e, void Function()? navFunc) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: Get.size.width / 2 - 32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'poster' + e.id.toString(),
                child: Container(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Hero(
                  tag: 'votes' + e.id.toString(),
                  child: buildRating(e.votes),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Hero(
                  tag: 'name' + e.id.toString(),
                  child: Text(
                    e.name!,
                    style: Get.theme.textTheme.headline3,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => navFunc!(),
    ),
  );
}