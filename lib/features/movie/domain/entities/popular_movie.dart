import 'package:equatable/equatable.dart';
import 'package:testcase/features/movie/data/models/popular_movies_model.dart';
import 'package:testcase/features/movie/domain/entities/results.dart';

class PopularMovies extends Equatable {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularMovies(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];

  factory PopularMovies.fromDataModel(PopularMoviesModel model) {
    return PopularMovies(
        page: model.page,
        results: model.results,
        totalPages: model.totalPages,
        totalResults: model.totalResults);
  }
}
