import 'package:show_tv/core/models/movie_model.dart';

class MovieResponse {
  List<MovieModel> result;
  String error;


  MovieResponse(this.result, this.error);

  MovieResponse.fromJson(Map<String , dynamic>json)
      : result = (json['results'] as List).map((e) => MovieModel.fromJson(e)).toList(),
        error = '';


  MovieResponse.withError(String error)
  : result = [],
    error = error;
}
