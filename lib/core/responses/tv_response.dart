import 'package:show_tv/core/models/tv_model.dart';

class TVResponse {
  List<TVModel> result;
  String error;


  TVResponse(this.result, this.error);

  TVResponse.fromJson(Map<String , dynamic>json)
      : result = (json['results'] as List).map((e) => TVModel.fromJson(e)).toList(),
        error = '';


  TVResponse.withError(String error)
      : result = [],
        error = error;
}
