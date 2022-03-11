import 'package:testcase/features/movie/domain/entities/popular_movie.dart';
import 'package:testcase/features/movie/domain/entities/results.dart';

class PopularMoviesModel extends PopularMovies {
  PopularMoviesModel(
      {required int? page,
      required List<Results>? results,
      required int? totalPages,
      required int? totalResults})
      : super(
            page: page,
            results: results,
            totalPages: totalPages,
            totalResults: totalResults);

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    var resultMovie = [];
    if (json['results'] != null) {
      resultMovie = json['results'] as List;
    }
    List<Results> orderMenus =
        resultMovie.map((i) => Results.fromJson(i)).toList();
    return PopularMoviesModel(
        page: json['page'],
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        results: orderMenus);
  }
}
