
import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';


abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  
  @override
  Future<List<MovieModel>> getNowPlaying() async{
    final response = await Dio().get(
     AppCounstance.nowPlayingMoviesPath
    );

    if(response.statusCode == 200){
      //Note: results is value from the json api response
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e)));

    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
    
  }
  
  @override
  Future<List<MovieModel>> getPopularMovies() async{
   final response = await Dio().get(
     AppCounstance.popularMoviesPath
    );

    if(response.statusCode == 200){
      //Note: results is value from the json api response
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e)));

    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
    
  }
  
  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(
     AppCounstance.topRatedMoviesPath
    );

    if(response.statusCode == 200){
      //Note: results is value from the json api response
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e)));

    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
    
  }
  }
  


