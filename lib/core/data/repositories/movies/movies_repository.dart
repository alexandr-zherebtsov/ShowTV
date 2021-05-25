import 'package:show_tv/core/base/base_repository.dart';
import 'package:show_tv/core/responses/movie_response.dart';

abstract class MoviesRepository extends BaseRepository {
  Future<MovieResponse> getMovie();
  Future<MovieResponse> getMovieByTest(int genre);
}
