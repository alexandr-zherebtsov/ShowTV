import 'package:get/get.dart';
import 'package:show_tv/core/data/repositories/movies/movies_repository.dart';
import 'package:show_tv/core/data/repositories/movies/movies_repository_impl.dart';
import 'package:show_tv/core/data/sources/remote/remote_data_source.dart';
import 'package:show_tv/core/data/sources/remote/remote_data_source_impl.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(), fenix: true);
    Get.lazyPut<MoviesRepository>(() => MoviesRepositoryImpl(Get.find()), fenix: true);
  }
}
