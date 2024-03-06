
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase): super( MoviesState()){
    on<GetNowPlayingMoviesEvent>((event, emit)async{// emit :cjange state
      
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(MoviesState(nowPlayingState: RequestState.loaded));
      print(result);
      result.fold(
        ((l) => emit(MoviesState(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ))
      ),
      (r) => emit(MoviesState(
        nowPlayingMovies: r,
        nowPlayingState: RequestState.loaded,
      )));
      // print(result);
    });
  }
}