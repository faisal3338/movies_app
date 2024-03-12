
import 'package:movies_app/features/movies/data/repository/domain/entites/movies.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      // required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});



factory MovieModel.fromJson(Map<String , dynamic> json) => MovieModel(
  id:json["id"],
  title:json ["title"], 
  backdropPath: json[ "backdrop_path"], 
  // genreIds: json["genre_ids"] != null ?  List<int>.from(json["genre_ids"].map((x) => genreIds.fromJson(x))) : List<SeriesNo>()., 
  overview: json["overview"], 
  voteAverage: json["vote_average"].toDouble(), 
  releaseDate: json["release_date"],
  );

}

// seriesNo: json["series_no"] != null ? new List<SeriesNo>.from( json["series_no"].map((x) => SeriesNo.fromJson(x))) : List<SeriesNo>().