import 'package:show_tv/core/data/repositories/movies/movies_repository.dart';
import 'package:show_tv/core/data/sources/remote/remote_data_source.dart';
import 'package:show_tv/core/responses/movie_response.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final RemoteDataSource _remoteDataSource;
  MoviesRepositoryImpl(this._remoteDataSource);

  @override
  Future<MovieResponse> getMovie() async {
    return await _remoteDataSource.getMovie();
  }
}