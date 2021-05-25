part of movie;

class MovieScreen extends StatelessWidget {
  final MovieModel movie;
  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: Get.size.height / 1.4,
              floating: true,
              pinned: false,
              shadowColor: AppColors.colorTransparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'poster' + movie.id.toString(),
                  child: Image.network(
                    movie.poster,
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
          ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Get.theme.appBarTheme.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorBlack.withOpacity(0.08),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(top: 18.0, bottom: 22.0, left: 10.0, right: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'name' + movie.id.toString(),
                        child: Text(
                          movie.name!,
                          style: Get.theme.textTheme.headline2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Hero(
                          tag: 'votes' + movie.id.toString(),
                          child: buildRating(movie.votes),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
                  child: Text(
                    AppLocalization.textDescription,
                    style: Get.theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 20.0, left: 10.0, right: 10.0),
                  child: Text(
                    movie.overview!,
                    style: Get.theme.textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
