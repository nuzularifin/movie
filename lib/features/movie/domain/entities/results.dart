import 'package:equatable/equatable.dart';

class Results extends Equatable {
  String? overview;
  int? id;
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  int? voteCount;
  bool? video;
  double? voteAverage;
  String? releaseDate;
  double? popularity;
  String? mediaType;
  String? firstAirDate;
  String? name;
  String? originalName;

  Results(
      {this.overview,
      this.id,
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.voteCount,
      this.video,
      this.voteAverage,
      this.releaseDate,
      this.popularity,
      this.mediaType,
      this.firstAirDate,
      this.name,
      this.originalName});

  @override
  List<Object?> get props => [
        overview,
        id,
        adult,
        backdropPath,
        genreIds,
        title,
        originalLanguage,
        originalTitle,
        posterPath,
        voteCount,
        video,
        voteAverage,
        releaseDate,
        popularity,
        mediaType,
        firstAirDate,
        name,
        originalName
      ];

  Results.fromJson(Map<String, dynamic> json) {
    overview = json['overview'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'];
    releaseDate = json['release_date'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['overview'] = overview;
    data['id'] = id;
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['poster_path'] = posterPath;
    data['vote_count'] = voteCount;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['release_date'] = releaseDate;
    data['popularity'] = popularity;
    data['media_type'] = mediaType;
    data['first_air_date'] = firstAirDate;
    data['name'] = name;
    data['original_name'] = originalName;
    return data;
  }
}
