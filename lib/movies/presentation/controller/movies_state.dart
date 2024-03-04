import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies; //state if data is get
  final RequestState nowPlayingState; // state if data is loading or error
  final String nowPlayingMessage;

  MoviesState(
      { this.nowPlayingMovies = const [],
       this.nowPlayingState = RequestState.loading,
       this.nowPlayingMessage = "",
       }); // if data is error use message
  @override
  List<Object?> get props => [nowPlayingMovies, nowPlayingState, nowPlayingMessage];
}
