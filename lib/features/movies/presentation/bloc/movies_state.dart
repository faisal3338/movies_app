// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/data/repository/domain/entites/movies.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;


  final List<Movie> popularMovies; //state if data is get
  final RequestState popularState; // state if data is loading or error
  final String popularMessage;

  final List<Movie> topRatedMovies; //state if data is get
  final RequestState topRatedState; // state if data is loading or error
  final String topRatedMessage;

  MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading, 
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
       this.popularState = RequestState.loading,
       this.popularMessage = "",
       this.topRatedMovies = const [],
       this.topRatedState = RequestState.loading,
       this.topRatedMessage = ""
    });

    

  @override
  List<Object> get props => [
    nowPlayingMovies, nowPlayingState, nowPlayingMessage,
    popularMovies, popularState, popularMessage,
    topRatedMovies, topRatedState, topRatedMessage
    ];
}
