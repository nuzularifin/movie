part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailMovieEvent extends MovieDetailEvent {
  final int idMovie;

  const GetDetailMovieEvent({required this.idMovie});
}

class RefreshDetailMovieEvent extends MovieDetailEvent {
  final int idMovie;

  const RefreshDetailMovieEvent({required this.idMovie});
}
