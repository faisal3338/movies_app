import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/data/repository/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/features/movies/data/repository/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/features/movies/data/repository/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_event.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies topRatedMovies;
  MovieBloc(
      this.getNowPlayingMovies, this.getPopularMovies, this.topRatedMovies)
      : super(MoviesState()) {
        
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMovies.execute();
      emit(MoviesState(nowPlayingState: RequestState.loaded));
      print(result);
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error, nowPlayingMessage: l.massage)),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });

    on<GetPopularMoviesEvent>((event, emit)async{
      final result = await getPopularMovies.ececute();

      result.fold(
          (l) => emit(MoviesState(
              popularState: RequestState.error, popularMessage: l.massage)),
          (r) => emit(MoviesState(
              popularMovies: r, nowPlayingState: RequestState.loaded)));
    });

        on<GetTopRatedMoviesEvent>((event, emit)async{
      final result = await topRatedMovies.execute();

      result.fold(
          (l) => emit(MoviesState(
              topRatedState: RequestState.error, topRatedMessage: l.massage)),
          (r) => emit(MoviesState(
              topRatedMovies: r, topRatedState: RequestState.loaded)));
    });
  }
}
