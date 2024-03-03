class AppCounstance{
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "e581c7dca5d3f100ec1dc4cce6425a2f";

  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  
  static const String popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";
}