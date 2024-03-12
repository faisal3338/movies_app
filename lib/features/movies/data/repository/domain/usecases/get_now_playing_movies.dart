import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movies/data/repository/domain/entites/movies.dart';
import 'package:movies_app/features/movies/data/repository/domain/repository/base_movies_repository.dart';

class GetNowPlayingMovies {
  final BaseMoviesRepository baseMoviesRepository ;

  GetNowPlayingMovies(this.baseMoviesRepository);
  
  Future<Either<Failure , List<Movie>>>execute() async{
   return await baseMoviesRepository.getNowPlayingMovies();
  }
}