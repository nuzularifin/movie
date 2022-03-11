import 'package:testcase/features/movie/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  MovieDetailModel(
      {required bool? adult,
      required String? backdropPath,
      required int? budget,
      required List<Genres>? genres,
      required String? homepage,
      required int? id,
      required String? imdbId,
      required String? originalLanguage,
      required String? originalTitle,
      required String? overview,
      required double? popularity,
      required String? posterPath,
      required List<ProductionCompanies>? productionCompanies,
      required List<ProductionCountries>? productionCountries,
      required String? releaseDate,
      required int? revenue,
      required int? runtime,
      required List<SpokenLanguages>? spokenLanguages,
      required String? status,
      required String? tagline,
      required String? title,
      required bool? video,
      required double? voteAverage,
      required int? voteCount})
      : super(
            adult: adult,
            backdropPath: backdropPath,
            budget: budget,
            genres: genres,
            homepage: homepage,
            id: id,
            imdbId: imdbId,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            productionCompanies: productionCompanies,
            productionCountries: productionCountries,
            releaseDate: releaseDate,
            revenue: revenue,
            runtime: runtime,
            spokenLanguages: spokenLanguages,
            status: status,
            tagline: tagline,
            title: title,
            video: video,
            voteAverage: voteAverage,
            voteCount: voteCount);

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    List<Genres> genres = <Genres>[];

    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
    }

    List<ProductionCompanies> productionCompanies = <ProductionCompanies>[];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies.add(ProductionCompanies.fromJson(v));
      });
    }

    List<ProductionCountries> productionCountries = <ProductionCountries>[];
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries.add(ProductionCountries.fromJson(v));
      });
    }

    List<SpokenLanguages> spokenLanguages = <SpokenLanguages>[];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages.add(SpokenLanguages.fromJson(v));
      });
    }

    return MovieDetailModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        budget: json['budget'],
        genres: genres,
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        productionCompanies: productionCompanies,
        productionCountries: productionCountries,
        releaseDate: json['release_date'],
        revenue: json['revenue'],
        runtime: json['runtime'],
        spokenLanguages: spokenLanguages,
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}
