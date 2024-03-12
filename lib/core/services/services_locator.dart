import 'package:get_it/get_it.dart';
import 'package:movies_app/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/features/movies/data/repository/movies_repository.dart';
import 'package:movies_app/features/movies/data/repository/domain/repository/base_movies_repository.dart';
import 'package:movies_app/features/movies/data/repository/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/features/movies/data/repository/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/features/movies/data/repository/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_bloc.dart';

final sl =GetIt.instance;

class ServicesLocator{
  void init() {
    
    sl.registerFactory(() => MovieBloc(sl() , sl() , sl(), ));

    ///use case 
    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));
    sl.registerLazySingleton(() => GetPopularMovies(sl()),);
    sl.registerLazySingleton(() => GetTopRatedMovies(sl()),);






    ///Repository 
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));

    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}