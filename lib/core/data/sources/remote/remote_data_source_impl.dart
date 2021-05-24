import 'dart:convert';
import 'package:show_tv/core/data/sources/remote/remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:show_tv/core/responses/actor_response.dart';
import 'package:show_tv/core/responses/movie_response.dart';
import 'package:show_tv/core/network/exception_handler.dart';
import 'package:show_tv/core/responses/tv_response.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio dio = Dio();
  final JsonDecoder _decoder = JsonDecoder();
  static const String apiKey = '10d39203e458fc0a8dec50a358c99540';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  String getMovieUrl = '$baseUrl/discover/movie';
  String getTvUrl = '$baseUrl/discover/tv';
  String getCreditsUrl = '$baseUrl';

  @override
  Future<MovieResponse> getMovie() async{
    var params = {
      'api_key' : apiKey,
      'language' : 'en-US',
      'page' : 1,
      'sort_by' : 'popularity.desc',
    };

    try{
      Response response = await dio.get(getMovieUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }
    catch(e) {
      handleErrorApp(e, decoder: _decoder);
      return MovieResponse.withError('$e');
    }
  }

  @override
  Future<TVResponse> getTv() async{
    var params = {
      'api_key' : apiKey,
      'language' : 'en-US',
      'page' : 1,
    };
    try{
      Response response = await dio.get(getTvUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    }
    catch(e) {
      handleErrorApp(e, decoder: _decoder);
      return TVResponse.withError('$e');
    }
  }

  @override
  Future<ActorResponse> getCredits (int id, String type)async{
    var params = {
      'api_key' : apiKey,
    };
    try {
      Response response = await dio.get("$getCreditsUrl/$type/$id/credits", queryParameters: params);
      print(response.data['cast']);
      return ActorResponse.fromJson(response.data);
    } catch(e) {
      handleErrorApp(e, decoder: _decoder);
      return ActorResponse.withError('$e');
    }
  }
}
