

import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl =GetIt.instance;

class ServicesLocator {
  void init(){
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    ///UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    ///Repository
    sl.registerLazySingleton(
      () => MoviesRepository(sl()));

    ///DATA SOURCING
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () =>MovieRemoteDataSource());
  }
}