class ApiConstance {
  static const String baseUrl= "https://api.themoviedb.org/3";
  static const String apiKey = "4305049c3685c82895eb9a40fbda1a1b";

  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  
  static const String popularMoviesPath =  "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";


  // static const String baseImageUrl = "https://image.tndb.org/t/p/w500";

  // static String imageUrl(String path)=> "$baseImageUrl$path";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl (String path) => '$baseImageUrl$path';
}
