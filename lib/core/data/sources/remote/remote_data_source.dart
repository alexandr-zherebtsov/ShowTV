import 'package:show_tv/core/responses/actor_response.dart';
import 'package:show_tv/core/responses/movie_response.dart';
import 'package:show_tv/core/responses/tv_response.dart';

abstract class RemoteDataSource {
  Future<MovieResponse> getMovie();
  Future<TVResponse> getTv();
  Future<ActorResponse> getCredits(int id, String type);
}
