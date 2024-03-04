
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc(): super( MoviesState()){
    on<GetNowPlayingMoviesEvent>((event, emit)async{// emit :cjange state
      BaseMovieRemoteDataSource baseMovieRemoteDataSource = MovieRemoteDataSource();
      BaseMoviesRepository baseMoviesRepository = MoviesRepository(baseMovieRemoteDataSource);
     final result = await GetNowPlayingMoviesUseCase(baseMoviesRepository).execute();
    });
  }
}